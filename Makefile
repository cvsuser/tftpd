CC=gcc
DBGFLAG=-ggdb 
CFLAGS=-std=c99 $(DBGFLAG) -Wall
LDLIBS=
LDFLAGS=$(DBGFLAG) -Os

SOURCES=tftp.c tftpd.c

OBJECTS=$(SOURCES:.c=.o)

TARGET=tftpd


.PHONY : clean run package erase

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) -o $(TARGET) $(LDFLAGS) $(LDLIBS) $(OBJECTS)

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

.depend: depend 


depend: $(SOURCES)
	ctags -R
	rm -f ./.depend
	$(CC) $(CFLAGS) -MM $^>>./.depend;
include .depend

erase:
	rm $(TARGET)
clean:
	rm $(OBJECTS)
