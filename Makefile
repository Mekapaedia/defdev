all: debug


fast: phony
	$(MAKE) -C src fast

debug: phony
	$(MAKE) -C src debug

test: phony
	$(MAKE) -C src test

docs:
	$(MAKE) -C src docs

clean:
	rm -rf $(EXE)
	$(MAKE) -C src clean

phony: 
	true
