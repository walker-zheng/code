######################################################################
#    makefile 模版
#    #
######################################################################

###################项目路径和程序名称#################################
DIR=$(shell pwd)
BIN_DIR=$(DIR)/bin
LIB_DIR=$(DIR)/lib
SRC_DIR=$(DIR)/src
INCLUDE_DIR=$(DIR)/include
OBJ_DIR=$(DIR)/obj
DEPS_DIR=$(DIR)/deps
#PROGRAM=$(BIN_DIR)/test
PROGRAM=$(BIN_DIR)/test
BOOST_DIR=/cygdrive/e/workspace/boost_1_55_0
BOOST_LIB=/cygdrive/e/workspace/boost_1_55_0/stage/lib

###################OBJ文件及路径############################################
EXTENSION=cpp
OBJS=$(patsubst $(SRC_DIR)/%.$(EXTENSION), $(OBJ_DIR)/%.o,$(wildcard $(SRC_DIR)/*.$(EXTENSION)))
DEPS=$(patsubst $(OBJ_DIR)/%.o, $(DEPS_DIR)/%.d, $(OBJS))

###################include头文件路径##################################
INCLUDE=\
		-I$(INCLUDE_DIR) -I$(BOOST_DIR)
LIBS=\
		-lboost_regex\
	 	-L$(LIB_DIR) -L$(BOOST_LIB)\
		-Wl,-rpath,$(BOOST_LIB)


###################lib文件及路径######################################

###################编译选项及编译器###################################
CC=g++
CFLAGS=-Wall -W -g
LDFLAGS=

###################编译目标###########################################
.PHONY: all clean rebuild

all:$(OBJS)
	@echo $(DEPS_DIR)
	$(CC) -o $(PROGRAM) $(OBJS) $(LDFLAGS) $(LIBS)


$(DEPS_DIR)/%.d: $(SRC_DIR)/%.$(EXTENSION)
	$(CC) -MM $(INCLUDE) $(CFLAGS) $< | sed -e 1's,^,$(OBJ_DIR)/,' > $@

sinclude $(DEPS)

$(OBJ_DIR)/%.o:$(SRC_DIR)/%.$(EXTENSION)
	$(CC) $< -o $@ -c $(CFLAGS) $(INCLUDE)

rebuild: clean all

clean:
	rm -rf $(OBJS)  $(PROGRAM)
