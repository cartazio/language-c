TESTS=analysis_enum analysis_ext_decls analysis_local_decls analysis_type_check attributes \
      bug5_dos_newline bugn6_empty_file bug21_sem_typedef bug22_file_permission_cpp bug30_preserve_int_repr bug31_pp_if_else \
      bug20130805_nopos
#bug20140111_utf8
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

