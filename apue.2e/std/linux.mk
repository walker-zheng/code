include ../Make.defines.linux

PROGS = conf options

all:	${PROGS}

conf:	conf.c

conf.c:
	gawk -f makeconf.awk >conf.c

options:	options.c

options.c:
	gawk -f makeopt.awk >options.c

clean:
	rm -f ${PROGS} ${TEMPFILES} options.c conf.c
