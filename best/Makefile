CC=g++ 
# Remove -g -O2 flags after debug
CXXFLAGS=-Wall -g -O2
LIBS= -lpthread
BIN	= serv tcp_cli udp_cli
OBJS= serv.o tcp_cli.o udp_cli.o

main:$(BIN)

#	$(BIN):$(OBJS)
#		$(CC) $(CXXFLAGS) -o $@ $(OBJS) $(LIBS)

%.o:%.c
	$(CC) $(CXXFLAGS) -o $<

clean:
	rm -f $(OBJS) $(BIN)
