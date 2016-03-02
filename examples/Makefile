VERSION?=$(shell cat ../language-c.cabal | grep '^Version:' | sed  -E 's/[ \t]+/ /g' | cut -sd' ' -f2)

EXAMPLES=ParseAndPrint ScanFile SearchDef TypeCheck ComputeSize dump_ast
all: $(EXAMPLES)
%: %.hs
	ghc -package language-c-$(VERSION) --make -O $*.hs

# requires package haskell-src
no_haskell_src=$(shell ghc-pkg list | grep -q haskell-src; echo $$?)
ifeq ($(no_haskell_src),0)
dump_ast: DumpAst
else
dump_ast:
	@echo "Note: skipping DumpAst, no haskell-src available"
endif

clean:
	rm -f *.o *.hi $(EXAMPLES)
clean_tmp:
	rm -f *.o *.hi
