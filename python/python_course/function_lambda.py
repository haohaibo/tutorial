
def build_quaratic_function(a,b,c):

    """Returns the function f(x) = ax^2 + bx + c"""

    return lambda x: a*x**2 + b*x + c

f = build_quaratic_function(2,3,-5)
print f(0)
print f(1)
print f(2)
