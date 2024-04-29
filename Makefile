.SUFFIXES: .c .cpp .o .exe .h
#compilator
FC = gcc
#linker
LINKER = $(FC) -o
#flagi
FCFLAGS = -c

NAME1 = cwiczenie1a
NAME2 = cwiczenie1b
NAME3 = cwiczenie1c
NAME4 = cwiczenie1d
NAME5 = cwiczenie1e

EXEC1 = $(NAME1).exe
OBJS1 = $(NAME1).o

EXEC2 = $(NAME2).exe
OBJS2 = $(NAME2).o

EXEC3 = $(NAME3).exe
OBJS3 = $(NAME3).o

EXEC4 = $(NAME4).exe
OBJS4 = $(NAME4).o

EXEC5 = $(NAME5).exe
OBJS5 = $(NAME5).o


#compilation
%.o: %.c
	$(FC) $(FCFLAGS) $^ -o $@

#execution
%.exe: %.o
	$(LINKER) $@ $^

cw1a: $(OBJS1)

cw1b: $(OBJS2)

cw1c: $(OBJS3)

cw1d: $(OBJS4)

cw1e: $(OBJS5)

run-cw1a: $(EXEC1)
	./$(EXEC1)

run-cw1b: $(EXEC2)
	./$(EXEC2)

run-cw1c: $(EXEC3)
	./$(EXEC3)

run-cw1d: $(EXEC4)
	./$(EXEC4)

run-cw1e: $(EXEC5)
	./$(EXEC5)

.PHONY: all
all: $(EXEC1) $(EXEC2) $(EXEC3) $(EXEC4) $(EXEC5)

help:
	@echo "command cw1x - compile a program to cwiczenie1x.o, where x = [a,b,c,d,e]"
	@echo "command run-cw1x - execute a program from cwiczenie1x, where x = [a,b,c,d,e]"
	@echo "command all - compile all programs"
	@echo "command clean - remove all files with extension .exe, .o, a.out"

.PHONY: clean
clean:
	@-rm *.exe *.o a.out 2>/dev/null
