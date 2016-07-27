import random, os
print("Battleships by UNST4BL3!")

ships = int(input("Enter ship count: "))
gridSize = 10
game = [[' ' for x in range(gridSize)] for y in range(gridSize)]

def getGrid(x,y):
    return game[x][y]

def setGrid(x,y,char):
    game[x][y] = char

for i in range(ships):              
    x = random.randint(0,gridSize-1)
    y = random.randint(0,gridSize-1)
    setGrid(x,y,'C')

xLabel = " " * 3
for i in range(gridSize):           
    xLabel += str(i) + " "

result = "Make a move!"
hits = 0

while hits != ships:
    os.system("cls")                
    print(" " + result + " [Ships: " + str(ships) + ", Size: " + str(gridSize) + ", Hits: " + str(hits) + "]\n")
    print(xLabel)                   
    for x in range(gridSize):
        print(" " + str(x) + " ",end="")
        for y in range(gridSize):
            print(" " * 2 if getGrid(x,y) == 'C' else getGrid(x,y) + " ",end="")
        print("")

    xGuess = int(input("\n X: "))
    yGuess = int(input(" Y: "))

    if getGrid(xGuess,yGuess) == 'C':
        result = "Hit! (" + str(xGuess) + ":" + str(yGuess) + ")"
        setGrid(xGuess,yGuess,'H')
        hits += 1
    else:
        result = "Miss! (" + str(xGuess) + ":" + str(yGuess) + ")"
        setGrid(xGuess,yGuess,'M')

print("\nCongratulations, you won the game!")
os.system("pause >nul")


