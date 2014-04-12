CC=gcc
DEVFLAGS=`sh devflags.sh`
DEVCFLAGS=$(DEVFLAGS) -c
DEVLDFLAGS=$(DEVFLAGS) -lgcov
CFLAGS=-O2 -march=native -fomit-frame-pointer -c
LDFLAGS=
SRC=
OBJ=$(SRC:.c=.o)
EXE=

all: $(SRC) $(EXE)

dev: docs $(SRC) $(EXE)
CFLAGS := $(DEVCFLAGS)
LDFLAGS := $(DEVLDFLAGS)

$(EXE): $(OBJ)
	$(CC) $(LDFLAGS) $(OBJ) -o $@

%.o: %.c
	$(CC) $(CFLAGS) $< -o $@

docs:
	rm -f docs.html
	doxygen
	ln -s html/index.html docs.html

clean:
	rm -rf $(SRC:.c=.gcno) $(SRC:.c=.gcda) $(SRC:.c=.gcov) $(OBJ)
	rm -rf html gmon.out docs.html $(EXE)
