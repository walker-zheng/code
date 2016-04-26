#! /usr/bin/python


def info(object, spacing=20, collapse=1):
    """Print method and doc strings.

    Takes module, class, list, dictionary, or string"""
    methodList  = [method for method in dir(object) if callable(getattr(object, method))]
    procFunc    = collapse and (lambda s: " ".join(s.split())) or (lambda s: s)
    print "\n".join(["%s %s" %
        (method.ljust(spacing),
        procFunc(str(getattr(object, method).__doc__)))
        for method in methodList ])


#   str type dir callable
if __name__ == "__main__":
    li = []
    d = {}
    print type(1)
    import types
    print type(types) == types.ModuleType
    print str(1),'\n',str([1, 2]),'\n',str((1,2)),'\n',str(None),'\n'
    print dir(li),'\n\n',dir(d),'\n\n',dir(types),'\n\n'
    print callable(''.join)

    import __builtin__
    print dir(__builtin__)

    li = ['Larry', 'Curly']
    print li,'\n',li.pop
    print getattr(li,'pop')
    getattr(li,'append')('Moe')
    print li
    print getattr({},'clear')
    print getattr((),'count')
    print getattr(types,'TypeType')
    print type(getattr(types,'TypeType')) == types.TypeType
    print getattr.__doc__
    li = ['a','Larry', 'Curly', 'b', 'b']
    print [elem for elem in li if len(elem)>1 ]
    print [elem for elem in li if li.count(elem)==1 ]


    print dir(object)
    print [method for method in dir(object) if callable(getattr(object, method))]

    a=''
    b='second'
#   safe and-or like ?: in C
    print (0 and [a] or [b])[0]

#   lambda      single line func
    g = lambda x: x*2
    print g(3)
    print (lambda x: x*2)(5)
    s="This is\n\t a \ttest\n"
    collapse=1
    procFunc=collapse and (lambda s: " ".join(s.split())) or (lambda s: s)
    print procFunc(s)
    print "\n".join(["%s %s" %
        (method.ljust(24),
        procFunc(str(getattr(object, method).__doc__)))
        for method in dir(object)
        if callable(getattr(object, method))])
    print "ljust\t\t","".join(getattr(str, 'ljust').__doc__.split())
    print "ljust\t\t","".join(str.ljust.__doc__.split())
    print info.__doc__
    print info(li)
