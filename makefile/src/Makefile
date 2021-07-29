# 1, simple
# by putting the list of files on which the command depends on the first line after the :, make knows that the rule hellomake needs to be executed if any of those files change. 
make1: hellomake.c hellofunc.c
# there is a tab before the gcc command in the makefile. 
# there must be a tab at the beginning of any command, and make will not be happy if it's not there.
	gcc -o hellomake hellomake.c hellofunc.c -I .


# 2, to be a bit more efficient
CC=gcc
# CFLAGS is the list of flags to pass to the compilation command
CFLAGS=-I .

make2: hellomake.o hellofunc.o
	$(CC) -o hellomake hellomake.o hellofunc.o


# 3, to fix dependency on the include files
CC=gcc
CFLAGS=-I .
# the set of .h files on which the .c files depend
DEPS = hellomake.h

# define a rule that applies to all files ending in the .o suffix. 
# the rule says that the .o file depends upon the .c version of the file and the .h files included in the DEPS macro. 
# the rule then says that to generate the .o file, make needs to compile the .c file using the compiler defined in the CC macro. 
# the -c flag says to generate the object file, 
# the -o $@ says to put the output of the compilation in the file named on the left side of the :, 
# the $< is the first item in the dependencies list
%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

make3: hellomake.o hellofunc.o 
	$(CC) -o hellomake hellomake.o hellofunc.o


# 4,
CC=gcc
CFLAGS=-I .
DEPS = hellomake.h
OBJ = hellomake.o hellofunc.o

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

# the special macros $@ and $^, which are the left and right sides of the :
make4: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)


# 5,
# our source code in a src directory, and the object files in an obj subdirectory within the src directory.
# putting our .h files in an include directory, 
# and some local libraries in a lib directory
IDIR = ../include
CC=gcc
CFLAGS=-I $(IDIR)

ODIR = obj
LDIR = ../lib

# math library
LIBS = -lm
_DEPS = hellomake.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = hellomake.o hellofunc.o 
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

hellomake: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)
# gcc -c -o obj/hellomake.o hellomake.c -I ../include
# gcc -c -o obj/hellofunc.o hellofunc.c -I ../include
# gcc -o hellomake obj/hellomake.o obj/hellofunc.o -I ../include -lm

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~ 
