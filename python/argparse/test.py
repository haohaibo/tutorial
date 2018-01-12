#!/usr/bin/python
import argparse

parser = argparse.ArgumentParser(description="put description here")
parser.add_argument("arg1", help = "first argument")
parser.add_argument("x", help = "second argument:the base", type = int)
#parser.add_argument("-v","--verbosity",help= "increase output verbosity",\
#        action="store_true")
parser.add_argument("-d","--device",help= "figure out witch device to use")
parser.add_argument("-v","--verbosity",help= "increase output verbosity")
parser.add_argument("--version",help= "show version")
#parser.add_argument("--version")
args = parser.parse_args()
print args
print args.arg1
if args.verbosity:
  print args.verbosity
  print "verbosity turned on"

awnser = args.x**2
print awnser
