#! /usr/bin/python

def listPrint(l):
    n = len(l)
    i = -n
    while i < n:
        print "l[",i,"] =", l[i]
        i = i + 1

if __name__ == "__main__":
    l = [0, 1, 2, 3, 4, 5]
    #   listPrint(l)
    print "l =",l
    print l[1:4]
    print l[:4]
    print l[:-1]
    print l.count(1), len(l), l.index(1)
    #   modify list
    l.append(6)
    print l
    l.extend([1, 1, 3, 2])
    print l
    l.insert(-1, 10)
    l.insert(0, 10)
    print l
    print l.pop()
    print l
    l.remove(10)
    print l
    l.reverse()
    print l
    l.sort()
    print l

    #   simulate stack
    a = []
    a.append(0)
    a.append(1)
    a.append(2)
    a.pop()
    a.pop()
    a.pop()

    #   simulate queue
    a = []
    a.insert(0, 0)
    a.insert(0, 1)
    a.insert(0, 2)
    a.pop()
    a.pop()
    a.pop()

    a = []
    a.append(0)
    a.append(1)
    a.append(2)
    a.pop(0)
    a.pop(0)
    a.pop(0)

#
    a = ["123", "456", "abc", "Abc", "AAA"]
    #center format
    print [k.center(9) for k in a]
#   filter & mapping
    print [k.upper() for k in a if k.isalpha()]
    print [k.lower() for k in a if k.isupper()]
    print [int(k) for k in a if k.isdigit()]
#   useful statement
#    [ k+1 for k in list ]
#    [ k for k in list if type(k) == types.IntType ]



# tuple (const list)
    a, b = (1, 2)
    print a, b

# sequence (string, list, tuple)
    if 2 in [1, 3, 2]:
        print 'OK'
    print "a"*3, (1, 2)*3, [2]*3

# dictionary (tuple[key, value])
    price_1 = {"clock":12, "table":100}
    price_2 = dict([('clock',12), ("table",100)])
    price_3 = dict((x, x*10) for x in [1, 2, 3])
    print price_1, price_2, price_3
    price_3.clear()
    price_3 = price_2.copy()
    print price_3.get("clock")
    print price_3["clock"]
    print price_3.has_key("clock")
    print price_3.has_key("cloud")

    # D.copy same as dict(D.items()), & faster
    #   or dict([(k, a[k]) for k in a.keys()])
    print price_3.items()
    print price_3.keys()
    print price_3.values()

    # D.update(E) same as :
    #           for k in E.keys():
    #               D[k] = E[k]

    print price_3.popitem()
    print range(1, 10, 2)
    print range(1, 10, -1)      #if unlimit then []
