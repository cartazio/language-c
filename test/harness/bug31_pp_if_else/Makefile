all:
	ghc --make -O2 Test.hs
	./Test > test.c
	gcc -o test_out test.c
	./test_out > test.out
	diff test.expect test.out
clean:
	rm -rf test.c test_out *.o *.hi *.dyn_hi *.dyn_o *.out
