#!/usr/bin/python

from pymc import DiscreteUniform, Exponential, deterministic, Poisson, Uniform, TruncatedNormal
import numpy as np

linear_array     = np.array([2,3,1,6,0,1,1,0,0,1,0,0])
spacewatch_array = np.array([1,1,0,0,0,0,0,1,0,0,0,0])
catalina_array   = np.array([9,5,9,6,4,1,6,6,9,5,4,3])
# panstarrs went into operation part way through the data
panstarrs_array  = np.array([None,None,None,None,0,0,1,4,1,2,0,2])
panstarrs_array  = np.ma.masked_equal(panstarrs_array, value=None)
other_array      = np.array([0,0,0,2,0,0,0,0,0,0,0,1])

#linear_mean     = Exponential('linear_mean', beta=1., value=1./np.average(linear_array))
#spacewatch_mean = Exponential('spacewatch_mean', beta=1., value=1./np.average(spacewatch_array))
#catalina_mean   = Exponential('catalina_mean', beta=1., value=1./np.average(catalina_array))
#panstarrs_mean  = Exponential('panstarrs_mean', beta=1., value=1.25)
#other_mean      = Exponential('other_mean', beta=1., value=1./np.average(other_array))

# produces basically the same result as the exponential priors
mu = np.average(linear_array)
linear_mean     = TruncatedNormal('linear_mean', a=0, b=10, mu=mu, tau=1., value=mu)
mu = np.average(spacewatch_array)
spacewatch_mean = TruncatedNormal('spacewatch_mean', a=0, b=10, mu=mu, tau=1., value=mu)
mu = np.average(catalina_array)
catalina_mean   = TruncatedNormal('catalina_mean', a=0, b=10, mu=mu, tau=1., value=mu)
mu = 1.25
panstarrs_mean  = TruncatedNormal('panstarrs_mean', a=0, b=10, mu=mu, tau=1., value=mu)
mu = np.average(other_array)
other_mean      = TruncatedNormal('other_mean', a=0, b=10, mu=mu, tau=1., value=mu)

linear_hits     = Poisson('linear_hits', mu=linear_mean,
                          value=linear_array, observed=True)
spacewatch_hits = Poisson('spacewatch_hits', mu=spacewatch_mean,
                          value=spacewatch_array, observed=True)
catalina_hits   = Poisson('catalina_hits', mu=catalina_mean,
                          value=catalina_array, observed=True)
panstarrs_hits  = Poisson('panstarrs_hits', mu=panstarrs_mean,
                          value=panstarrs_array, observed=True)
other_hits      = Poisson('other_hits', mu=other_mean,
                          value=other_array, observed=True)

linear_next     = Poisson('linear_next', mu=linear_mean)
spacewatch_next = Poisson('spacewatch_next', mu=spacewatch_mean)
catalina_next   = Poisson('catalina_next', mu=catalina_mean)
panstarrs_next  = Poisson('panstarrs_next', mu=panstarrs_mean)
other_next      = Poisson('other_next', mu=other_mean)

@deterministic()
def allof2014(lin=linear_next,
                sw=spacewatch_next,
                cata=catalina_next,
                pan=panstarrs_next,
                oth=other_next):
    return 6 + lin + sw + cata + pan + oth

@deterministic()
def le10(count=allof2014):
    return count<=10

@deterministic()
def r11_20(count=allof2014):
    return 11<=count and count<=20

@deterministic()
def r21_40(count=allof2014):
    return 21<=count and count<=40

@deterministic()
def r41_60(count=allof2014):
    return 41<=count and count<=60

@deterministic()
def gt60(count=allof2014):
    return 60<count

import pymc
model = pymc.Model([le10, r11_20, r21_40, r41_60, gt60, allof2014,
                    linear_next, spacewatch_next, catalina_next,
                    panstarrs_next, other_next
                ])
M = pymc.MCMC(model)
M.sample(iter=60000, burn=5000)
M.summary()

counts = { }
total = 0
for v in M.trace('allof2014'):
    counts[v] = counts.get(v, 0) + 1
    total += 1
total = float(total) / 100.0
for k in sorted(counts.keys()):
    print "%4i %.1f%%" % (k, counts[k]/total)
