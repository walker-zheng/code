###
# multi bin separate compile
#
###

CC=g++
CXXFLAGS=-Wall -g -O2
# Remove -g -O2 flags after debug


DIR=$(shell pwd)
BIN_DIR=$(DIR)/bin
SRC_DIR=$(DIR)/src
SRC  = $(wildcard $(SRC_DIR)/*.cpp)
SRC += $(wildcard $(SRC_DIR)/*.c)
BIN_ = $(patsubst $(SRC_DIR)/%.cpp, $(BIN_DIR)/%,$(SRC))
BIN  = $(patsubst $(SRC_DIR)/%.c, 	$(BIN_DIR)/%,$(BIN_))

all: $(BIN)

$(BIN_DIR)/%:$(SRC_DIR)/%.cpp
	$(CC) $(CXXFLAGS) -o $@ $<

$(BIN_DIR)/%:$(SRC_DIR)/%.c
	$(CC) $(CXXFLAGS) -o $@ $<

clean:
	rm -rf $(BIN)
