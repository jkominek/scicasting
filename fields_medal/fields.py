#!/usr/bin/python

import subprocess
import csv
import os
import StringIO
import itertools

m = [
    "Avila, Artur", False,
    "Bhargava, Manjul", False,
    "Borodin, Alexei", False,
    "Brendle, Simon", False,
    "Breuillard, Emmanuel", False,
    "Bringmann, Kathrin", True,
    "Chudnovsky, Maria", True,
    "Csornyei, Marianna", True,
    "Figalli, Alessio", False,
    "Galatius, Soren", False,
    "Green, Ben", False,
    "Guth, Larry", False,
    "Hairer, Martin", False,
    "Helfgott, Harald", False,
    "Lurie, Jacob", False,
    "Mirzakhani, Maryam", True,
    "Morel, Sophie", True,
    "Naor, Assaf", False,
    "Saint-Raymond, Laure", True,
    "Serfaty, Sylvia", True,
    "Sheffield, Scott", False,
    "Venkatesh, Akshay", False
]

n = { }
for i in range(0, len(m), 2):
    n[m[i]] = m[i+1]
m = n

n = { }
for name in m.keys():
    (a,b) = name.split(", ")
    newname = "%s %s" % (b, a)
    n[newname] = m[name]
m = n

# ./scholar.py --cookie-file=cookies -c 20 --csv --author "Kathrin Bringmann"

total_cite_count = 0
cites = { }
probability = { }

for name in m.keys():
    if os.access(name, os.R_OK):
        out = open(name).read()
    else:
        out = subprocess.check_output(["./scholar.py", "--cookie-file=cookies", "--csv", "--author", name])
        open(name,"w").write(out)

    data = list(csv.reader(StringIO.StringIO(out), delimiter='|'))
    citations = map(lambda x: int(x[3]), data)
    cites[name] = sum(citations)
    total_cite_count += cites[name]

for name in cites.keys():
    probability[name] = float(cites[name]) / total_cite_count

male_prob_mass = 0.0
female_prob_mass = 0.0

four = float(len("xxxxxxx"))
three = float(len("xx"))
two = float(len("xx"))

for combo in itertools.combinations(m.keys(), 4):
    prob = four
    female_winner = False
    for name in combo:
        prob *= probability[name]
        female_winner = female_winner or m[name]
    if female_winner:
        female_prob_mass += prob
    else:
        male_prob_mass += prob

for combo in itertools.combinations(m.keys(), 3):
    prob = three
    female_winner = False
    for name in combo:
        prob *= probability[name]
        female_winner = female_winner or m[name]
    if female_winner:
        female_prob_mass += prob
    else:
        male_prob_mass += prob

for combo in itertools.combinations(m.keys(), 2):
    prob = two
    female_winner = False
    for name in combo:
        prob *= probability[name]
        female_winner = female_winner or m[name]
    if female_winner:
        female_prob_mass += prob
    else:
        male_prob_mass += prob

print male_prob_mass / (male_prob_mass + female_prob_mass)
print female_prob_mass / (male_prob_mass + female_prob_mass)
