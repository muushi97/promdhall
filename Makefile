BINDIR := bin
DHALL2YAML := $(BINDIR)/dhall-to-yaml-ng

DHALLDIR := dhalls

FILES_DHALLS := $(shell find $(DHALLDIR) -type f -name '*.dhall')
FILES_YAMLS := $(patsubst %.dhall,%.yml,$(FILES_DHALLS))

YAMLS := $(FILES_YAMLS)


.PHONY: all


all: $(YAMLS)

%.yml: %.dhall $(DHALL2YAML)
	./$(DHALL2YAML) --file $< --output $@

$(DHALL2YAML): ./.tmp/dhall-yaml.tar.bz2
	mkdir -p ./.tmp/dhall-yaml
	tar --extract --file ./.tmp/dhall-yaml.tar.bz2 -C ./.tmp/dhall-yaml
	mkdir -p $(BINDIR)
	cp -r ./.tmp/dhall-yaml/bin/* $(BINDIR)
./.tmp/dhall-yaml.tar.bz2:
	mkdir -p ./.tmp
	curl -L https://github.com/dhall-lang/dhall-haskell/releases/download/1.42.0/dhall-yaml-1.2.12-x86_64-linux.tar.bz2 > ./.tmp/dhall-yaml.tar.bz2

