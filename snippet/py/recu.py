#! /usr/bin/python

def buildConnectString(params):
    """ Build a connect String from a dictionary of parameters.

    Returns String."""
    return ";".join(["%s=%s" % (k,v) for k,v in params.items()])
def fib(n):
    print 'n=',n
    if n>1:
        return fib(n-1)*n
    else:
        print 'end of the lines'
        return 1


if __name__ == "__main__":
    myParams = {"Server":"mpilgrim",\
            "database":"master",\
            "uid":"sa",\
            "pwd":"secret"\
            }
    print buildConnectString(myParams).__doc__
    print buildConnectString(myParams)
    print "fib(5)=%s" % fib(5)

