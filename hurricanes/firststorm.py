#!/usr/bin/python

from datetime import datetime, date, timedelta
from pymc import *
import numpy as np

dates = [ date(1992, 4, 21),
          date(1993, 5, 31),
          date(1994, 6, 30),
          date(1995, 6, 2),
          date(1996, 6, 17),
          date(1997, 6, 1),
          date(1998, 7, 27),
          date(1999, 6, 11),
          date(2000, 6, 7),
          date(2001, 6, 4),
          date(2002, 7, 14),
          date(2003, 4, 20),
          date(2004, 7, 31),
          date(2005, 6, 8),
          date(2006, 6, 10),
          date(2007, 5, 9),
          date(2008, 5, 31),
          date(2009, 5, 28),
          date(2010, 6, 25),
          date(2011, 6, 28),
          date(2012, 5, 19),
          date(2013, 6, 5) ]

relative_days = [ ]

for d in dates:
    end_of_june = date(d.year, 6, 30)
    relative_days.append((d - end_of_june).days)

days_array = np.array(relative_days)

simple_mean = np.mean(days_array)
simple_stddev = np.std(days_array)

def predict(today, FORECAST_CLEAR):
    days_mean = Uniform('days_mean', lower=-90, upper=90)
    days_tau = Uniform('days_tau', upper=1.0, lower=1.0/(simple_stddev*2)**2,
                       value=1.0/simple_stddev**2)
    
    days = Normal('days', mu=days_mean, tau=days_tau,
                  value=days_array, observed=True)
    
    next_year = Normal('next_year', mu=days_mean, tau=days_tau)
    
    end_of_june = date(today.year, 6, 30)
    today = (today - end_of_june).days
    
    @deterministic()
    def before_july(next_year=next_year):
        return next_year<=0
        
    @potential()
    def not_before_today(next_year=next_year):
        if next_year <= (today + FORECAST_CLEAR):
            return -1e10
        else:
            return 0.0

    model = Model([not_before_today, before_july, days, days_mean, days_tau])

    M = MCMC(model)
    M.sample(iter=70000, burn=10000, verbose=0, progress_bar=False)
    return M

# http://www.nhc.noaa.gov/
# True if there is nothing with 48-hour formation
# potential on the map
FORECAST_48_HOUR_CLEAR = False

M = predict(date.today(), 2 if FORECAST_48_HOUR_CLEAR else 0)
print "Today"
print np.mean(M.trace('before_july')[:])

M = predict(date.today()+timedelta(1), 1.5 if FORECAST_48_HOUR_CLEAR else 0)
print "Tomorrow"
print np.mean(M.trace('before_july')[:])

M = predict(date.today()+timedelta(2), 0.25 if FORECAST_48_HOUR_CLEAR else 0)
print "2 days from now"
print np.mean(M.trace('before_july')[:])

M = predict(date.today()+timedelta(3), 0.0 if FORECAST_48_HOUR_CLEAR else 0)
print "3 days from now"
print np.mean(M.trace('before_july')[:])

M = predict(date.today()+timedelta(4), 0.0 if FORECAST_48_HOUR_CLEAR else 0)
print "4 days from now"
print np.mean(M.trace('before_july')[:])
