CFLAGS += -g --std=c89 -D_POSIX_C_SOURCE=2 -D_BSD_SOURCE
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
