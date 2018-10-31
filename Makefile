CRYSTAL_BIN ?= $(shell which crystal)
SHARDS_BIN ?= $(shell which shards)
FP_BIN ?= $(shell which fp)
PREFIX ?= /usr/local

build:
	$(SHARDS_BIN) build --release $(CRFLAGS)
clean:
	rm -f ./bin/fp ./bin/fp.dwarf
test: build
	$(CRYSTAL_BIN) spec
install: build
	mkdir -p $(PREFIX)/bin
	cp ./bin/fp $(PREFIX)/bin
reinstall: build
	cp ./bin/fp $(FP_BIN) -rf
