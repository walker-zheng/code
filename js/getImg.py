def getImg():
    if 1:
        for x in xrange(1,10):
            print x

def fib(n):
    if n <= 0:
        return 0
    if n == 1:
        return 1
    return fib(n - 1) + fib(n - 2)

def fib_loop(n):
    a,b=0,1
    for i in range(n):
        yield a
        a,b=b,a+b
print list(fib_loop(12))


def consumer():
    while  True:
        d = yield
        if not d: break
        print "consumer:", d

c = consumer()
c.send(None)
c.send(1)
c.send(3)
c.send(None)

# for x in count(10, step = 2):
#     print x
#     if x > 50: break

class Data(object):
    """docstring for Data"""
    def __init__(self, *args):
        self._data = list(args)
    def __iter__(self):
        return DataIter(self)

class DataIter(object):
    """docstring for DataIter"""
    def __init__(self, data):
        self._index = 0
        self._data = data._data
    def next(self):
        if self._index >= len(self._data): raise StopIteration()
        d = self._data[self._index]
        self._index += 1
        return d




class Data_1(object):
    """docstring for Data"""
    def __init__(self, *args):
        self._data = list(args)
    def __iter__(self):
        for x in self._data:
            yield x


