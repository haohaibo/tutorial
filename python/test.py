#class myclass1:
class myclass1:
    half = 4
    def __init__(self):
      self.a = [0] 
      myclass1.add(self.a)
      print "self.a = %s" % self.a 

    @staticmethod
    def add(b):
      b[0] += 1 
      print b
    def isHalf(self):
      if self.half == 4:
        return True
      else:
        return False

if __name__ == "__main__":
    c1 = myclass1()
    print c1
    print c1.a
    print c1.half
    print c1.isHalf()
    

