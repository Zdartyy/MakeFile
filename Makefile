#compilator
FC = gcc
#linker
LINKER = -Wall -std=c99 -pedantic

NAME1 = producer
NAME2 = consumer
NAME3 = cwiczenie5

EXEC1 = $(NAME1).exe
OBJS1 = $(NAME1).o

EXEC2 = $(NAME2).exe
OBJS2 = $(NAME2).o

EXEC3 = $(NAME3).exe
OBJS3 = $(NAME3).o

FIFO_PATH = my_fifo

#compilation
%.o: %.c
	$(FC) -c $<

# execution
%.exe: %.o
	$(FC) $(LINKER) -o $@ $^
	chmod +x $@

$(EXEC1): $(OBJS1) 
	$(FC) $(LINKER) -o $@ $^
	chmod +x $@

$(EXEC2): $(OBJS2) 
	$(FC) $(LINKER) -o $@ $^
	chmod +x $@

$(EXEC3): $(OBJS3)
	$(FC) $(LINKER) -o $@ $^
	chmod +x $@

cw5: $(EXEC3) $(EXEC1) $(EXEC2)

run-cw5a: $(EXEC3) $(EXEC1) $(EXEC2)
	./$(EXEC3) $(EXEC1) $(EXEC2) dane.txt wyniki.txt

run-cw5b: $(EXEC1) $(EXEC2)
	mkfifo $(FIFO_PATH)
	xterm -hold -title PRODUCENT -e ./$(EXEC1) $(FIFO_PATH) dane.txt &
	xterm -hold -title KONSUMENT -e ./$(EXEC2) $(FIFO_PATH) wyniki.txt
	rm $(FIFO_PATH)
	diff -s dane.txt wyniki.txt

.PHONY: all
all: $(EXEC1) $(EXEC2) $(EXEC3)

help:
	@echo "command cw5 - compile programs to cwiczenie5"
	@echo "command run-cw5a - execute a program from cwiczenie5"
	@echo "command run-cw5b - create a FIFO and execute the producer and consumer programs in separate terminals"
	@echo "command all - compile all programs"
	@echo "command clean - remove all files with extension .exe, .o, a.out"

.PHONY: clean
clean:
	@-rm *.exe *.o a.out 2>/dev/null