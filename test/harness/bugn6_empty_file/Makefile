all:
	ghc --make -O2 Test.hs
	./Test > test.out
	diff test.expect test.out
clean:
	rm -rf Test.o Test.hi Test test.out
