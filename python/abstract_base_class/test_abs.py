### current bpython session - make changes and save to reevaluate session.
### lines beginning with ### will be ignored.
### To return to bpython without reevaluating make no changes to this file
### or save an empty file.
from abc import ABCMeta
class MyABC:
    __metaclass__ = ABCMeta
    

type(MyABC)
### <class 'abc.ABCMeta'>
MyABC.register(tuple)
type(MyABC)
### <class 'abc.ABCMeta'>
assert issubclass(tuple,MyABC)
assert isinstance(tuple,MyABC)
### Traceback (most recent call last):
###   File "<input>", line 1, in <module>
###     assert isinstance(tuple,MyABC)
### AssertionError
### 
