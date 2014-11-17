SRC=
EXE=
EXTRACFLAGS=
EXTRALDFLAGS=
export SRC
export EXE
export EXTRACFLAGS
export EXTRALDFLAGS

all: debug


fast: phony
	$(MAKE) -f Makefile.fast.gcc

debug: phony docs
	$(MAKE) -f Makefile.dev.gcc

docs:
	rm -f docs.html
	doxygen
	ln -s html/index.html docs.html

clean:
	rm -rf $(SRC:.c=.gcno) $(SRC:.c=.gcda) $(SRC:.c=.gcov) $(SRC:.c=.o)
	rm -rf html gmon.out docs.html $(EXE) *.dyn *.dpi *.lock

phony: 
	true
