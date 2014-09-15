###
# multi bin separate compile
#
###
CC=g++ -std=c++11
CXXFLAGS=-Wall -g -O2
# Remove -g -O2 flags after debug
LIBS= -lpthread
DIR=$(shell pwd)
BIN_DIR=$(DIR)/bin
SRC_DIR=$(DIR)
SRC = $(wildcard $(SRC_DIR)/*.cpp)
SRC += $(wildcard $(SRC_DIR)/*.c)
BIN_ = $(patsubst $(SRC_DIR)/%.cpp, $(BIN_DIR)/%,$(SRC))
BIN = $(patsubst $(SRC_DIR)/%.c, $(BIN_DIR)/%,$(BIN_))
all: $(BIN)
$(BIN_DIR)/%:$(SRC_DIR)/%.cpp
	$(CC) $(CXXFLAGS) -o $@ $< $(LIBS)
$(BIN_DIR)/%:$(SRC_DIR)/%.c
	$(CC) $(CXXFLAGS) -o $@ $< $(LIBS)
clean:
	rm -rf $(BIN)
