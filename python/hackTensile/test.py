import os
import sys
import time
from Common import startTime
# 从import的时刻起，startTime已经赋值

time.sleep(2)
print "startTime %s" % startTime

currentTime = time.time()
print "currentTime %s" % currentTime 
dur = currentTime - startTime 
print "dur = %s" % dur
