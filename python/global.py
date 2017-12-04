#!/usr/bin/python

HR = "################################################"
x = 3
def test_local():
  x = 2333
  print "in test_local fun: x = %d" % x

def test_global():
  global x
  x = 2333
  print "in test_global fun: x = %d" % x

if __name__ == "__main__":

  print HR
  print "#"
  print "#",
  test_local()
  print "# Global x = %d" % x

  print "#"

  print "#",
  test_global()
  print "# Global x = %d" % x
  print "#"
  print HR
