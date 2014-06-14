#!/usr/bin/python

# needs XML files from top500 site

import lxml.etree as etree
import sys

top = etree.parse(open(sys.argv[1])).getroot()

print sys.argv[1]

running = 0.0
total_rmax = 0.0

total_cores = 0

for entry in top:
    rmax = None
    cores = None
    for field in entry:
        if field.tag == '{http://www.top500.org/xml/top500/1.0}number-of-processors':
            cores = int(field.text)
        if field.tag == '{http://www.top500.org/xml/top500/1.0}r-max':
            rmax = float(field.text)
    running += rmax*rmax/cores
    total_rmax += rmax
    total_cores += cores

print "  weighted", running / total_rmax
print "unweighted", total_rmax / total_cores
print
