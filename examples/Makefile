VERSION?=$(shell cat ../language-c.cabal | grep '^Version:' | sed  -E 's/[ \t]+/ /g' | cut -sd' ' -f2)

EXAMPLES=ParseAndPrint ScanFile SearchDef TypeCheck ComputeSize DumpAst
all: $(EXAMPLES)
%: %.hs
	ghc -package language-c-$(VERSION) --make -O $*.hs
clean:
	rm -f *.o *.hi $(EXAMPLES)
clean_tmp:
	rm -f *.o *.hi
