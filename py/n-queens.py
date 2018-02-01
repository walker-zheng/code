from itertools import *
def queens(n):
    cols = range(n)
    for vec in permutations(cols):
        # x-y==x+y==n
        if (n == len(set(vec[i]+i for i in cols))
              == len(set(vec[i]-i for i in cols))):
            printVec(vec)
def printVec(vec):
    cols = len(vec)
    for i in [0..cols]:
        for j in vec:
            if (i == j):
                print('X')
            else:
                print('O')
queens(5)
