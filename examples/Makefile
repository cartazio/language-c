# build examples

ifndef HC
	HC=ghc
endif

ifndef OPT
	OPT=-O -rtsopts
endif

ifdef PROFILE
	OPT += -prof -auto-all
endif

INPLACE_PACKAGE_CONF=$(shell dirname `pwd`)/dist/package.conf.inplace

VERSION?=$(shell cat ../language-c.cabal | grep '^Version:' | sed  -E 's/[ \t]+/ /g' | cut -sd' ' -f2)
OPT += -Wall -package-db $(INPLACE_PACKAGE_CONF)  -package language-c-$(VERSION)


EXAMPLES=ParseAndPrint ScanFile SearchDef TypeCheck ComputeSize DumpAst
all: $(EXAMPLES)
%: %.hs
	$(HC) $(OPT) --make $*.hs

demo_compute_size:
	gcc -DDEBUG compute_size.c -o compute_size.bin && ./compute_size.bin
	./ComputeSize 'comp' compute_size.c | gcc -x c -o compute_size_hs.bin - && \
	  ./compute_size_hs.bin

clean: clean_tmp
	rm -f $(EXAMPLES)
clean_tmp:
	rm -f *.o *.hi *.bin
