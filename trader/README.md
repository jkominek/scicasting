# Setup

You'll need:
* a SciCast account
* an API key
* to know your user ID number

Make a file for storing your user ID and API key.
It goes in ~/scicast_apikey.txt (if you don't know
what that expands to on your operating system, run
the following in python:

   import os.path
   print os.path.expanduser("~/scicast_apikey.txt")

First line is the user ID, second line is the API key, like:

```
296
a94aa000f9a94cc5
```

(No, that isn't my API key.)

After you've finished testing it against test.scicast.org,
open up the program in your favorite text editor, and locate
the string "test.scicast.org" and change it to "scicast.org"
so it will execute against the real market.

# Usage

To run it, provide some question ID numbers on the command line:

```
[jkominek@kyatt scicasting/trader]$ ./manual.py 418 748
Processing question IDs: 418, 748
Question #418: Will the identity of Satoshi Nakamoto be identified by December 31, 2014?
Probabilities:  77.50%, 22.50%
  Likelihoods:  3.4, 1.0
  Your assets:  95.6, -177.5
Beliefs? 9 1  
Maximum debt? 200
 Target Trade:  80.74%, 19.26%
 Asset change:  5.9, -22.5
 Final assets:  101.5, -200.0
        Debit:  22.458
 Orig utility:  68.2601544915
  New utility:  71.337863308
  Util change:  3.0777
Execute trade? y
Saving beliefs...
Executing trade!
 Asset change:  5.9, -22.5
   New market:  80.74%, 19.26%

Question #748: What will be the peak percentage of users accessing Google via IPv6 at the end of January 2015?
Probabilities:  41.00%, 59.00%
  Likelihoods:  1.0, 1.4
  Your assets:  171.9, 233.6
Beliefs? 0.166666 0.833333
Maximum debt? 10
 Target Trade:  16.67%, 83.33%
 Asset change:  -129.8, 49.8
 Final assets:  42.1, 283.4
        Debit:  129.842
 Orig utility:  223.319482804
  New utility:  243.190159759
  Util change:  19.8707
Execute trade? y
Saving beliefs...
Executing trade!
 Asset change:  -129.8, 49.8
   New market:  16.67%, 83.33%
```

For the first question, I entered "9 1" as my beliefs.
On yes/no questions, the first likelihood is for 'no',
the second is for 'yes'. So that corresponded to a 10%
belief that Nakamoto would be identified.

The second question is a scaled question. The program
doesn't yet understand them enough to let you enter
your belief in the units the website displays. So we
have to know that for that question 'no' corresponds
to 4.5% and 'yes' to 6%. We can take our belief (5.75%),
and scale it ( (5.75-4.5)/(6-4.5) = 0.83333 ) to get
our likelihood for yes. Subtract that from 1.0 to get
the likelihood for no.

After you provide your beliefs and maximum debt (the
maximum number of points you want tied up in this question),
the program will present you with what the utility
function decided to do, and ask if you want to execute
the trade. If you do, it saves your belief and debt
info into its database, and executes the trade.

If you'd like to avoid having to answer any questions,
you can provide the -a option on the command line,
and the program will look up your beliefs in the database
and execute the corresponding trade (if it is sufficiently
worthwhile), without asking you.

# Upcoming features

* Add a command line option to automatically process every question in the database.
* Better user interface for scaled questions.
* Graceful error handling in the unlikely(?) event you have Python without SQLite
* Allow the user to switch utility functions on a per-question basis, and store the preference in the database.
