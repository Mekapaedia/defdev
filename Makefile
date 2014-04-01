CC=gcc
DEVFLAGS=`echo devflags.txt`
DEVCFLAGS=-c $(DEVFLAGS)
DEVLDFLAGS=$(DEVFLAGS) -lgcov
SRC=
OBJ=$(SRC:.c=.o)
EXE=geargui

all: $(SRC) $(EXE) docs

$(EXE): $(OBJ)
	$(CC) $(DEVLDFLAGS) $(OBJ) -o $@
%.o: %.c
	$(CC) $(DEVCFLAGS) $< -o $@
docs:
	rm docs.html
	doxygen
	ln -s html/index.html docs.html
clean:
	rm -rf $(OBJ) $(EXE) *.gcno *.gcda *.gcov gmon.out html docs.html
