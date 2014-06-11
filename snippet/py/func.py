#! /usr/bin/python


def myjoin(str, sep=","):
    return sep.join(str)
def printf(format, *arg):
    print type(arg)
    print format % arg
def printf3(format, *arg, **keyword):
    ''' args with name '''
    print format % arg
    for k in keyword.keys():
        print "keyword[%s]:%s" % (k, keyword[k])
def incfun(a):
    return lambda x:x+a
def change(x, y):
    x = 2               # bind change
    y[0] = 'hello'      # mod obj


if __name__ == "__main__":
    print myjoin(["a", 'b', 'c'])
    print myjoin(["a", 'b', 'c'], ';')
    printf ("%d > %d", 4, 1)
    printf3 ("ok[%s]:%s", "keyword", "value", four=4, two=2)
    print ' '.join.__doc__
    print range.__doc__

    f = lambda a, b: a+b
    print f(3, 5)
    print f("3", "five")
    print incfun(3)(12)
    x, y = 1, [1, 2]
    change(x, y)
    print x, ":", y             # x,y in local ns

# module
    import testmodule

    print testmodule.__doc__
    print testmodule.age
    testmodule.age=1
    print testmodule.age
    print testmodule.sayHi
    testmodule.sayHi()
    sayHi=testmodule.sayHi
    sayHi()

    from testmodule import age, sayHi
    print age
    sayHi()

    import sys
    print sys.path      # find module path

# package mkdir with __init__.py
    import pkgtest.testmodule
    pkgtest.testmodule.sayHi()


# name space : mapping name to object, like a symbol pool
# global: when enter python
# local : exsiting in its scope
    print __name__
    print locals()
    print globals()
# using smart pointer gc name & object which unbind
# python is strong type, dynamic type
    print sayHi()
