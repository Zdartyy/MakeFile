# Name of compiler
FC = gcc
# Variable for compiler flags
FCFLAGS = -c
# Variable for linker flags
LINKER = $(FC) -o

# Variable for the name of program
PROG = start.exe

#Variable that stores the source files
OBJS = cwiczenie1.c


$(PROG): $(OBJS)
	$(LINKER) $(PROG) $(OBJS)
	./$(PROG)
	rm *.exe

clean:
	rm *.exe