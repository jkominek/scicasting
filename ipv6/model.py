#!/usr/bin/python

from datetime import datetime, date, timedelta
from pymc import *
import numpy as np

values = [ ]
for l in open("google_ipv6.txt").readlines():
    if l[0] in "0123456789":
        (y,m,d,v) = l.split()
        values.append(float(v))
values.reverse()
y = np.array(values)
x = np.array(range(0, len(values)))

tau_lower=100
tau_upper=1000

def do_linear_model():
    intercept = Uniform('intercept', lower=0, upper=5)
    slope = Uniform('slope', lower=0, upper=1)
    tau = Uniform('tau', lower=tau_lower, upper=tau_upper, plot=False)

    y_est = intercept + slope * x

    y_hat = Normal('y', mu=y_est, tau=tau, value=y, observed=True)

    model = Model([y_hat, y_est, tau, slope, intercept])
    M = MCMC(model)
    M.sample(iter=50000, burn=5000, progress_bar=False)
    return M

#M = do_linear_model()
#M.summary()
#print "DIC", M.dic

def do_split_model():
    tau = Uniform('tau', lower=tau_lower, upper=tau_upper, plot=False)

    a_intercept = Uniform('a_intercept', lower=0, upper=5)
    a_slope = Uniform('a_slope', lower=0, upper=1)
    b_intercept = Uniform('b_intercept', lower=0, upper=5)
    b_slope = Uniform('b_slope', lower=0, upper=1)
    c_intercept = Uniform('c_intercept', lower=0, upper=5)
    c_slope = Uniform('c_slope', lower=0, upper=1)

    a_b_switch = DiscreteUniform('a_b_switch',
                                 value=10,
                                 lower=0, upper=len(y)-2)
    b_c_switch = DiscreteUniform('b_c_switch',
                                 value=len(y)-10,
                                 lower=2, upper=len(y))

    @potential
    def switch_limitation(a_b=a_b_switch, b_c=b_c_switch):
        if a_b < b_c:
            return 0.0
        else:
            return -np.inf

    @deterministic
    def y_est(a_b=a_b_switch, b_c=b_c_switch,
              a_intercept=a_intercept, a_slope=a_slope,
              b_intercept=b_intercept, b_slope=b_slope,
              c_intercept=c_intercept, c_slope=c_slope,
              x=x):
        def helper(x):
            if x <= a_b:
                return a_intercept + a_slope * x
            elif x <= b_c:
                return b_intercept + b_slope * x
            else:
                return c_intercept + c_slope * x
        return np.array(map(helper, x))

    y_hat = Normal('y_hat', mu=y_est, tau=tau, value=y, observed=True)

    model = Model([y_hat, y_est, tau, switch_limitation,
                   a_intercept, a_slope,
                   b_intercept, b_slope,
                   c_intercept, c_slope])
    M = MCMC(model)
    M.sample(iter=10000, burn=1000)
    return M

#M = do_split_model()
#M.summary()
#print "DIC", M.dic

def do_split_weekday_model():
    tau = Uniform('tau', lower=tau_lower, upper=tau_upper, plot=False)

    weekday = np.empty(7, dtype=object)
    for i in range(0, 7):
        weekday[i] = Uniform(date(2014,1,1+i).strftime("%A"),
                             lower=-0.5, upper=0.5)

    a_intercept = Uniform('a_intercept', lower=0, upper=5)
    a_slope = Uniform('a_slope', lower=0, upper=1)
    b_intercept = Uniform('b_intercept', lower=0, upper=5)
    b_slope = Uniform('b_slope', lower=0, upper=1)
    c_intercept = Uniform('c_intercept', lower=0, upper=5)
    c_slope = Uniform('c_slope', lower=0, upper=1)

    a_b_switch = DiscreteUniform('a_b_switch',
                                 value=10,
                                 lower=0, upper=len(y)-2)
    b_c_switch = DiscreteUniform('b_c_switch',
                                 value=len(y)-10,
                                 lower=2, upper=len(y))

    @potential
    def switch_limitation(a_b=a_b_switch, b_c=b_c_switch):
        if a_b < b_c:
            return 0.0
        else:
            return -np.inf

    N = len(x)
    @deterministic
    def y_est(a_b=a_b_switch, b_c=b_c_switch,
              a_intercept=a_intercept, a_slope=a_slope,
              b_intercept=b_intercept, b_slope=b_slope,
              c_intercept=c_intercept, c_slope=c_slope,
              x=x, weekday=weekday):
        out = np.zeros(N, dtype=np.float64)
        for x in x:
            if x <= a_b:
                out[x] = a_intercept + a_slope * x + weekday[x % 7]
            elif x <= b_c:
                out[x] = b_intercept + b_slope * x + weekday[x % 7]
            else:
                out[x] = c_intercept + c_slope * x + weekday[x % 7]
        return out

    y_hat = Normal('y_hat', mu=y_est, tau=tau, value=y, observed=True)

    model = Model([y_hat, y_est, tau, switch_limitation,
                   a_intercept, a_slope,
                   b_intercept, b_slope,
                   c_intercept, c_slope])
    M = MCMC(model)
    M.sample(iter=10000, burn=1000)
    return M

#M = do_split_weekday_model()
#M.summary()
#print "DIC", M.dic

def do_weekday_model(target, future_limit):
    tau = Uniform('tau', lower=tau_lower, upper=tau_upper, plot=False)

    weekday = np.empty(7, dtype=object)
    for i in range(0, 7):
        weekday[i] = Uniform(date(2014,1,1+i).strftime("%A"),
                             lower=-0.5, upper=0.5)

    intercept = Uniform('intercept', lower=0, upper=5, value=2)
    slope = Uniform('slope', lower=0, upper=1, value=0.01)

    N = len(x)
    @deterministic(plot=False)
    def y_est(intercept=intercept, slope=slope,
              x=x, weekday=weekday):
        out = np.zeros(N, dtype=np.float64)
        for x in x:
            out[x] = intercept + slope * x + weekday[x % 7]
        return out

    y_hat = Normal('y_hat', mu=y_est, tau=tau, value=y, observed=True, plot=False)

    x_future = range(len(x), future_limit)
    l_x = len(x_future)

    @deterministic
    def first_day(intercept=intercept, slope=slope,
                  x=x_future, weekday=weekday):
        for i in range(0, l_x):
            xf = x_future[i]
            v = intercept + slope * xf + weekday[xf % 7]
            if v > target:
                return xf
        return future_limit+1

    model = Model([y_hat, y_est, tau,
                   intercept, slope, #june_4, july_4, august_4,
                   first_day])
    M = MCMC(model)
    M.sample(iter=25000, burn=2500)
    return M

M = do_weekday_model(4.0, 365)
M.summary()
print "DIC", M.dic

counts = { }
trace = list(M.trace('first_day'))
for day in trace:
    counts[day] = 1 + counts.get(day, 0)
days = sorted(counts.keys(), key=lambda k: counts[k], reverse=True)
total = float(len(trace))
for d in sorted(days[0:20]):
    y = d // 365
    doy = d % 365
    # our days of year were 0-indexed, instead of the normal
    # 1-indexed. bump them up for human display
    dt = date(2014+y, 1, 1) + timedelta(doy)
    print "%s %.2f" % (dt.isoformat(), counts[d]/total*100.0)
