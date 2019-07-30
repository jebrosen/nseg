CFLAGS += -g --std=c89

# for getopt
CFLAGS += -D_POSIX_C_SOURCE=2

# for memccpy
CFLAGS += -D_BSD_SOURCE

# for _BSD_SOURCE deprecation with glibc >= 2.20
CFLAGS += -D_DEFAULT_SOURCE

CFLAGS += -Wall -Wextra -Wold-style-definition

LDLIBS += -lm

all : nseg nmerge

.PHONY: all clean

genwin.o : genwin.c genwin.h
	$(CC) $(CFLAGS) -c -o $@ $<

nseg : nseg.c lnfac.h genwin.h genwin.o
	$(CC) $(CFLAGS) -o $@ $< genwin.o $(LDLIBS)

nmerge : nmerge.c genwin.h genwin.o
	$(CC) $(CFLAGS) -o $@ $< genwin.o $(LDLIBS)

clean:
	rm -f nseg nmerge genwin.o
