#!/usr/bin/python

# needs XML files from top500 site

import lxml.etree as etree
import sys
import os, re
import numpy
import scipy.optimize
from math import exp, log

per_watt = [ ]
per_core = [ ]

def analyze(filename, churn=0):
    top = etree.parse(open(filename)).getroot()

    msg = [filename]

    running_per_core = 0.0
    running_per_watt = 0.0
    total_rmax = 0.0
    total_rmax_w_power = 0.0
    total_cores = 0
    total_watt = 0.0

    worst_per_core = 1e12
    best_per_core = 0.0
    worst_per_watt = 1e12
    best_per_watt = 0.0

    for entry in list(top)[:500-churn]:
        rmax = None
        cores = None
        power = None
        for field in entry:
            if field.tag == '{http://www.top500.org/xml/top500/1.0}system-name':
                pass #print field.text
            if field.tag == '{http://www.top500.org/xml/top500/1.0}number-of-processors':
                cores = int(field.text)
            if field.tag == '{http://www.top500.org/xml/top500/1.0}r-max':
                rmax = float(field.text)
            if field.tag == '{http://www.top500.org/xml/top500/1.0}power':
                try:
                    power = float(field.text) * 1000.0
                except:
                    pass

        running_per_core += rmax*rmax/cores
        total_rmax += rmax
        total_cores += cores

        best_per_core = max(best_per_core, rmax/cores)
        worst_per_core = min(worst_per_core, rmax/cores)

        if power:
            total_rmax_w_power += rmax
            running_per_watt += rmax*rmax/power
            total_watt += power

            best_per_watt = max(best_per_watt, rmax/power)
            worst_per_watt = min(worst_per_watt, rmax/power)

    msg += [" -per-core",
            "    weighted %f" % (running_per_core / total_rmax,),
            "  unweighted %f" % (total_rmax / total_cores,),
            "       worst %f" % (worst_per_core,),
            "        best %f" % (best_per_core,)]
    per_core.append( running_per_core / total_rmax )

    try:
        msg += [" -per-watt",
                "    weighted %f" % (running_per_watt / total_rmax_w_power,),
                "  unweighted %f" % (total_rmax_w_power / total_watt,),
                "       worst %f" % (worst_per_watt,),
                "        best %f" % (best_per_watt,)]
        per_watt.append( running_per_watt / total_rmax_w_power )
    
    except:
        pass
    print "\n".join(msg)+"\n"

files = os.listdir(".")
files = filter(lambda f: re.match("TOP.+xml$", f), files)
for f in sorted(files):
    try:
        analyze(f)
    except:
        pass

def rate_info(points, forward=1, weight=False, narrow=False):
    x = range(0, len(points))
    rates = []
    weights = []
    for use, w in zip(range(3, len(points)),
                           range(len(points), 0, -1)):
        current_x = x[-use:]
        current_p = points[-use:]
        p = numpy.polyfit(current_x, current_p, 1)
        rates.append(p[0] * (current_x[-1] + forward) + p[1])
        weights.append(w)

    for use, weight in zip(range(3, len(points)),
                           range(len(points), 0, -1)):
        current_x = x[-use:]
        current_p = points[-use:]
        p = numpy.polyfit(current_x, current_p, 2)
        rates.append(p[0] * (current_x[-1] + forward)**2 + p[1] * (current_x[-1] + forward) + p[2])
        weights.append(w)

    emodel = lambda x, a, b: a*numpy.exp(b*x)
    lmodel = lambda x, a, b: a*numpy.log(b*x)

    if not narrow:
        for use, weight in zip(range(3, len(points)),
                               range(len(points), 0, -1)):
            current_x = x[-use:]
            current_p = points[-use:]
            m, crap = scipy.optimize.curve_fit(emodel, current_x, current_p)
            rates.append(emodel((current_x[-1] + forward), *m))
            weights.append(w)

        for use, weight in zip(range(3, len(points)),
                               range(len(points), 0, -1)):
            current_x = x[-use:]
            current_p = points[-use:]
            m, crap = scipy.optimize.curve_fit(lmodel, current_x, current_p)
            rates.append(lmodel((current_x[-1] + forward), *m))
            weights.append(w)

    if weight:
        rates = numpy.repeat(rates, weights)
    rates = numpy.asarray(rates, dtype=numpy.float64)
    return numpy.asarray(numpy.percentile(rates, [0, 20, 40, 60, 80, 100]))

aa = numpy.asarray

forward = 2

print "wide"

print "core", list(rate_info(per_core, forward))
print "watt", list(rate_info(per_watt, forward))

print "narrow"

print "core", list(rate_info(per_core, forward, narrow=True))
print "watt", list(rate_info(per_watt, forward, narrow=True))
