#!/usr/bin/python

from pymc import *
import numpy as np

tflops_array = np.array(map(int, open("data.points").readlines()))

tflops_mean  = Normal('tflops_mean', mu=np.average(tflops_array),
                      tau=1.0/(5000.0**2.0))

tflops = Normal('tflops', mu=tflops_mean, tau=1.0/(1000**2.0),
                value=tflops_array, observed=True)

tflops_next = Normal('tflops_next', mu=tflops_mean, tau=1.0/(1000**2.0))

@deterministic()
def hit30001(tflops=tflops_next):
    return tflops>=30001

model = Model([hit30001, tflops_next])

M = MCMC(model)
M.sample(iter=50000, burn=5000)
M.summary()
