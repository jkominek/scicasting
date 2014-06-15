#!/usr/bin/python

from pymc import *
import numpy as np

storms_array = np.array(map(int, open("data.points").readlines()))

storms_mean  = Exponential('storms_mean', beta=1.0/np.average(storms_array))

storms = Poisson('storms', mu=storms_mean,
                 value=storms_array, observed=True)

storms_next = Poisson('storms_next', mu=storms_mean)

@deterministic()
def hit15(storms=storms_next):
    return storms>=15

model = Model([hit15, storms_next])

M = MCMC(model)
M.sample(iter=50000, burn=5000)
M.summary()
