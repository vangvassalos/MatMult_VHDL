C = gcc
CFLAGS = -g -Wall -std=c99

SOURCES=$(wildcard *.c)
OBJECTS=$(SOURCES:.c=.o)
EXEC = dotproduct


EXEC: $(OBJECTS)
	$(CC) $(OBJECTS) -o $(EXEC)

%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	$(RM) $(EXEC) $(OBJECTS)
