def reverse(word):
    if (word == ""):
        return word
    else:
        subProblem = word[1:]
        subSolution = reverse(subProblem)
        solution = subSolution + word[0]
        return solution

def __main__():
    hello = "helloworld"
    print(hello + ' reverse:')
    print(reverse(hello))
__main__()
