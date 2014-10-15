#!/usr/bin/python

# This program is an example of using the SciCast API.
#
# Copyright (c) 2014, Jay Kominek
#
# Permission to use, copy, modify, and/or distribute this software for
# any purpose with or without fee is hereby granted, provided that the
# above copyright notice and this permission notice appear in all
# copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL
# WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE
# AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL
# DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA
# OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
# TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.

# You'll need an account, and an API key.
# If you modify this to make trades automatically, keep in mind the
# site's user agreement, and don't be a jerk. Rate limit your access
# to the site.

import numpy
from scipy.optimize import minimize
import json
import urllib
import urllib2
import os
import os.path
import sys
import gzip
import math
from StringIO import StringIO
from optparse import OptionParser

parser = OptionParser()
# You could add some options to do different things, like
# back out of your positions, maximizing the points you get
# while minimizing the negative effect on your expected value, etc

#parser.add_option("-b", action="store_true", default=False,
#                  dest="back_out", help="Back out of existing position?")
(options, args) = parser.parse_args()

API_KEY_filename = os.path.expanduser("~/scicast_apikey.txt")
if not os.access(API_KEY_filename, os.R_OK):
    print "Make sure your API key is in", API_KEY_filename
    sys.exit(-1)
API_KEY = open(API_KEY_filename).read().strip()

# Wraps up all of the HTTP action in a single place. Applies
# the API key, ensures we're gzip'ing things, and leaves you
# with just a single place to turn SSL on/off
def fetch_url(path, args, host="test.scicast.org", ssl=False):
    args['api_key'] = API_KEY
    tupes = [ (str(k),str(args[k])) for k in args.keys() ]
    fmt_args = ("s" if ssl else "",
                host,
                path,
                urllib.urlencode(tupes))
    req = urllib2.Request("http%s://%s/%s?%s" % fmt_args)
    req.add_header('Accept-encoding', 'gzip')

    r = urllib2.urlopen(req)
    if r.info().get('Content-Encoding') == 'gzip':
        buf = StringIO(r.read())
        f = gzip.GzipFile(fileobj=buf)
        data = json.load(f)
    else:
        data = json.loads(r.read())

    return data

# Take an array of trade records, count them, total up your
# assets, and find the current state of the market. Return
# all of that.
def summarize_trades(ts):
    ts.sort(key=lambda t: t['created_at'])
    assets = ts[0]['assets_per_option']
    for t in ts[1:]:
        assets = map(lambda a,b: a+b, assets, t['assets_per_option'])
    trade_count = len(ts)
    current_probs = ts[-1]['new_value_list']
    return (trade_count, current_probs, assets)

def normalize_probabilities(likelihoods):
    total = float(sum(likelihoods))
    return [ float(l)/total for l in likelihoods ]

def lmsr(old, new):
    asset_change = [ ]
    l2 = math.log(2.0)
    for o, n in zip(old, new):
        # The division is being done in log space for
        # reasons of numerical stability
        v = 100.0 * (math.log(n)/l2 - math.log(o)/l2)
        asset_change.append(v)
    return asset_change

# This maximizes the expected value of your position
# while respecting a maximum spending limit. In the
# event that you've exceeded that limit, it just treats
# what you're currently at as the limit. That prevents
# the optimizer from exploding.
def evmax(beliefs=None,
          initial_probabilities=None,
          initial_assets=None,
          maximum_debt=None, **kwargs):
    maximum_debt = min(maximum_debt, min(initial_assets))
    def f(x):
        # compute our state after this hypothetical trade
        change = lmsr(initial_probabilities, x)
        final = map(lambda a,b: a+b, initial_assets, change)

        if min(final)<maximum_debt:
            # unacceptable input? positive infinity!
            return numpy.inf

        ev = sum(map(lambda b,a: b*a, beliefs, final))
        # we're running a minimizer, so flip the sign
        return -ev
    return f

# Minimize regret (the difference between whatever you
# end up with, and the best possible outcome).
def regret(initial_probabilities=None,
           initial_assets=None, **kwargs):
    # compute the best possible outcomes
    best = initial_assets[:]
    for i in range(0, len(initial_probabilities)):
        presumed = [ 0.001 / (len(initial_probabilities)-1) ] * len(initial_probabilities)
        presumed[i] = 1.0
        # now sum(presumed) == 1.0
        change = lmsr(initial_probabilities, presumed)
        best[i] += change[i]
    def f(x):
        change = lmsr(initial_probabilities, x)
        final = map(lambda a,b: a+b, initial_assets, change)
        regret = max(map(lambda a,b: a-b, best, final))
        return regret
    return f

question_ids = map(int, args)

print "Processing question IDs:", ", ".join(map(str, question_ids))

for qid in question_ids:
    # get all of our trades on this question, so we know what
    # our assets are
    ts = fetch_url("trades/index",
                   {'question_id': qid,
                    'include_current_probs': True,
                    'summary_view_only': True
                })

    trade_count, current_probs, assets = summarize_trades(ts)
    print "Question #%i: %s" % (qid, ts[0]['question']['name'])
    print "Probabilities: ", \
        ", ".join([ "%.2f%%" % (p*100.0,) for p in current_probs ])

    # this is just the probabilities shifted up to be larger numbers,
    # so our poor fleshy brains can think about them in terms of ratios.
    minp = min(current_probs)
    print "  Likelihoods: ", \
        ", ".join([ "%.1f" % (p/minp,) for p in current_probs ])

    print "  Your assets: ", \
        ", ".join([ "%.1f" % (a,) for a in assets ])

    # For added convenience, you could look the beliefs up from a database
    # Additional ideas:
    #  - make the beliefs a function of time
    #  - query some web pages, do some math
    #  - https://github.com/eBay/bayesian-belief-networks

    beliefs = [ ]
    while len(beliefs) != len(current_probs):
        raw_belief = raw_input("Beliefs? ")
        try:
            lhs = map(float, raw_belief.split())
            beliefs = normalize_probabilities(lhs)
        except Exception, e:
            print e

    # and maybe compute this based on the strength of your belief, and
    # the time until question resolution

    debt = raw_input("Maximum debt? ")
    debt = -float(debt)

    # This is just a simple EV maximization utility function
    # you can swap it out with whatever you want. at a minimum
    # you need to provide your beliefs and current_probs or
    # your trading is going to be strange at best. more ideas:
    # - kelly betting (log utility)
    #   - a bit tricky to deal with questions where you've
    #     already exceeded your bankroll.
    # - incorporate present value calculations based on time
    #   to question resolution
    #   - can be applied to evmax or kelly
    # - vary your utility function depending on the question.
    #   - maybe for long term questions you just want to
    #     speculate and maximize your current score with no
    #     regard for how the question will resolve
    #     - use the datamart to analyze the market, not this
    #       interface!
    #   - kelly is a bit more complicated for scaled continuous
    #     questions. (got to maximize over an integral of a
    #     probability density function representing your belief.)

    info = { 'beliefs': beliefs,
             'initial_probabilities': current_probs,
             'initial_assets': assets,
             'maximum_debt': debt }
    util = evmax(**info)
    #util = regret(**info)

    # this is just a constraint being applied to the minimization
    # process. it forces all of the probabilities to sum to 1.
    # removing the constraint will do weird things.
    def con_f(v):
        return sum(v) - 1.0
    con = { 'type': 'eq', 'fun': con_f }

    # woo optimize the things
    # technically this is complete overkill, but now you don't
    # have to worry about whatever crazy stuff you want to put
    # into your utility function
    res = minimize(util,
                   current_probs,
                   # these bounds prevent it from trading below
                   # 0.1% or above 99.9%. you can widen those
                   # bounds, but there isn't much value in it.
                   bounds=[(0.001, 0.999)] * len(current_probs),
                   constraints=[con],
                   method='slsqp')

    if not res.success:
        # this probably means you replaced the evmax
        # routine with something else that isn't quite right
        print "*** Trade optimization failed!"
        print "Good luck:"
        print res
        print "\n\n"
        continue

    # we'll renormalize just in case the optimizer did
    # something weird. still on you to visually check
    # the result.
    target = normalize_probabilities(res.x)
    print " Target Trade: ", \
        ", ".join([ "%.2f%%" % (p*100.0,) for p in target ])

    # this is how much your assets on every option are
    # going to change.
    change = lmsr(current_probs,  target)
    print " Asset change: ", \
        ", ".join([ "%.1f" % (c,) for c in change ])

    # this is what your assets will be after the trade
    final = map(lambda a,b: a+b, assets, change)
    print " Final assets: ", ", ".join([ "%.1f" % (f,) for f in final ])

    # this is what the web interface would display for
    # your credit/debit as you move the slider around
    credit_debit = min(final) - min(assets)
    if credit_debit >= 0.0:
        print "       Credit: %.3f" % (credit_debit,)
    else:
        print "        Debit: %.3f" % (-credit_debit,)

    # check with the user.
    # enter anything start with 'y' to make the trade
    execute_p = raw_input("Execute trade? ")
    if not (len(execute_p)>0 and execute_p.lower()[0]=='y'):
        print "ok, skipping it!"
        continue

    print "Executing trade!"
    ts = fetch_url("trades/create",
                   {'question_id': qid,
                    # the 0.0001 is there in case of any
                    # floating point rounding issues.
                    'max_allowed_cost': 0.0001-min(change),
                    'new_value': ",".join(map(str,target)),
                    'old_values': ",".join(map(str,current_probs)),
                    'include_tradeable_questions': False,
                    # API docs say to set these to 0
                    'interface_type': 0,
                    'user_selection': 0,
                })

    # here's what scicast says about your trade:
    print " Asset change: ", \
        ", ".join([ "%.1f" % (c,) for c in ts['trade']['assets_per_option'] ])
    print "   New market: ", \
        ", ".join([ "%.2f%%" % (p*100.0,) for p in ts['trade']['new_value_list'] ])
