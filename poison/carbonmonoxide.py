#!/usr/bin/python

from pymc import *
import numpy as np

lt5_array    = np.array([ 1374, 1605, 1576, 1674 ])
r6_12_array  = np.array([ 1291, 1134, 1173, 1069 ])
r13_19_array = np.array([  763,  810,  802,  916 ])
ge20_array   = np.array([ 5901, 6843, 6352, 6286 ])
unk_array    = np.array([ 178+1802+229,
                          129+1812+221,
                          191+2075+235,
                          181+2167+163 ])

lt5_mean     = Exponential('lt5_mean', beta=1./np.average(lt5_array))
r6_12_mean   = Exponential('r6_12_mean', beta=1./np.average(r6_12_array))
r13_19_mean  = Exponential('r13_19_mean', beta=1./np.average(r13_19_array))
ge20_mean    = Exponential('ge20_mean', beta=1./np.average(ge20_array))
unk_mean     = Exponential('unk_mean', beta=1./np.average(unk_array))

lt5_exposures    = Poisson('lt5_exposures', mu=lt5_mean,
                           value=lt5_array, observed=True)
r6_12_exposures  = Poisson('r6_12_exposures', mu=r6_12_mean,
                           value=r6_12_array, observed=True)
r13_19_exposures = Poisson('r13_19_exposures', mu=r13_19_mean,
                           value=r13_19_array, observed=True)
ge20_exposures   = Poisson('ge20_exposures', mu=ge20_mean,
                           value=ge20_array, observed=True)
unk_exposures    = Poisson('unk_exposures', mu=unk_mean,
                           value=unk_array, observed=True)

lt5_next    = Poisson('lt5_next', mu=lt5_mean)
r6_12_next  = Poisson('r6_12_next', mu=r6_12_mean)
r13_19_next = Poisson('r13_19_next', mu=r13_19_mean)
ge20_next   = Poisson('ge20_next', mu=ge20_mean)
unk_next    = Poisson('unk_next', mu=unk_mean)

@deterministic()
def exposures2013(lt5=lt5_next, r6_12=r6_12_next,
                  r13_19=r13_19_next, ge20=ge20_next,
                  unk=unk_next):
    return lt5 + r6_12 + r13_19 + ge20 + unk

@deterministic()
def lt10k(count=exposures2013):
    return count < 10000

model = Model([lt10k, exposures2013, lt5_next, r6_12_next, r13_19_next, ge20_next, unk_next])

M = MCMC(model)
M.sample(iter=100000, burn=1000)
M.summary()
