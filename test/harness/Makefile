TESTS=attributes analysis_enum analysis_ext_decls analysis_local_decls analysis_type_check \
      bug5_dos_newline bug21_sem_typedef bug22_file_permission_cpp bug30_preserve_int_repr bug31_pp_if_else \
      bugn6_empty_file
all: compile_examples compile_test $(TESTS:=.runtest)
compile_examples:
	make -C ../../examples clean all
compile_test:
	make -C ../
clean: $(TESTS:=.runclean)
%.runtest:
	make -C $* clean all
%.runclean:
	make -C $* clean

