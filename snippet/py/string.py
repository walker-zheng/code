#! /usr/bin/python

def func(a, b):
    """
    comment 1
    """
    print "a = %(a)d, b = %(b)d" % locals()
    '''
    comment 2
    '''

if __name__ == "__main__":
    print "hello " \
            'world'
    print "hello" + 'world'
    print "this it test".capitalize()
    print "this it test".lower()
    print "this it test".upper()
    print "This It Test".swapcase()
    print len("hello" + "world")
    s = "Hello"
    index = range(-len(s), len(s))
    print index
    print [ s[i] for i in index ]
    print "abc eee 111".find("1", 4, 8)
    #   index fell, return valueerror exception
    #   print "abc eee 111".index("1", 4, 8)
    print "abc eee 111".index("1", 4, 9)
    #   rfind rindex
    print "abc eee 111".count("1", 4, 11)

    print "%#d %#o %#u %#x %#X" % (15, 15, 15, 15, 15)

    # repr() get obj with py expression
    print "%r" % ({"one":1, "two":2})
    # str()  not normal description
    print "%s" % ({"one":1, "two":2})

    print "%(name)s's height is %(height)dcm, "\
            "%(name)s's weight is %(weight)dkg"\
            % dict([("name","Kulou"), ("height",168), ("weight",70)])
            #% {"name":"Kulou", "height":168, "weight":70}

    func(5, 10)
    func(1, 2).__doc__
    #   ljust rjust
    print len("hello world".ljust(16))
    print "hello world".rjust(16)
    print "hello world".center(16)
    #   trip blank
    print "\t   a \t".lstrip()
    print "\t   a \t".rstrip()
    print "\t   a \t".strip()

    #   join & split
    print "_".join(["Hello", "world", "python", "said"])
    print "This is a book".split(" ")
