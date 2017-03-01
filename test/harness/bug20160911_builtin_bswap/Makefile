PP=../../../examples/ParseAndPrint
TY=../../../examples/TypeCheck
all:
	gcc -Wall -o /dev/null test.c
	$(PP) test.c > test.out
	$(TY) test.c >> test.out
	diff -u test.expect test.out
clean:
	rm -f *.out
