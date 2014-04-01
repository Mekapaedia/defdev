CC=gcc
#DEVFLAGS=-ansi -ggdb3 -pg -O0 -Wall -Wextra -pedantic -Wdeclaration-after-statement \
-Wshadow -Wpointer-arith -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes \
-Wno-missing-braces -Wno-missing-field-initializers -Wformat=2 \
-Wswitch-default -Wswitch-enum -Wcast-align -Wpointer-arith \
-Wbad-function-cast -Wstrict-overflow=5 -Wstrict-prototypes -Winline \
-Wundef -Wnested-externs -Wcast-qual -Wunreachable-code \
-Wlogical-op -Wfloat-equal -Wstrict-aliasing=2 -Wredundant-decls \
-Wold-style-definition \
-fno-omit-frame-pointer -ffloat-store -fno-common -fstrict-aliasing \
-fprofile-arcs -ftest-coverage -D_POSIX_C_SOURCE=200112L
DEVFLAGS=`./devflags.sh`
CFLAGS=-c $(DEVFLAGS) `pkg-config --cflags gtk+-2.0`
LDFLAGS=$(DEVFLAGS) `pkg-config --libs gtk+-2.0` -lgcov
SRC=geargui.c net/net.c
OBJ=$(SRC:.c=.o)
EXE=geargui

all: $(SRC) $(EXE) docs

$(EXE): $(OBJ)
	$(CC) $(LDFLAGS) $(OBJ) -o $@
%.o: %.c
	$(CC) $(CFLAGS) $< -o $@
docs:
	doxygen
	ln -s html/index.html docs.html
clean:
	rm -rf $(OBJ) $(EXE) *.gcno *.gcda *.gcov gmon.out net/*.gcno net/*.gcda net/*.gcov html docs.html docs.html
