#!  /bin/python


def f(x):
    return x%3==0 or x%5==0

filter(f, range(2, 25))
