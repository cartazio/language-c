VERSION?=$(shell cat ../language-c.cabal | grep '^Version:' | sed  -E 's/[ \t]+/ /g' | cut -sd' ' -f2)

EXAMPLES=ParseAndPrint ScanFile SearchDef TypeCheck ComputeSize DumpAst
all: $(EXAMPLES)
%: %.hs
	ghc -package language-c-$(VERSION) --make -O $*.hs

demo_compute_size:
	gcc -DDEBUG compute_size.c -o compute_size.bin && ./compute_size.bin
	./ComputeSize 'comp' compute_size.c | gcc -x c -o compute_size_hs.bin - && \
	  ./compute_size_hs.bin

clean: clean_tmp
	rm -f $(EXAMPLES)
clean_tmp:
	rm -f *.o *.hi *.bin
