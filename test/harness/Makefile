TESTS=analysis_enum \
      analysis_ext_decls \
      analysis_local_decls \
      analysis_type_check attributes \
      bug5_dos_newline bugn6_empty_file bug21_sem_typedef \
      bug22_file_permission_cpp bug30_preserve_int_repr bug31_pp_if_else \
      bug20130805_nopos \
      bug20160302_int128 \
      bug20160314_noreturn

#bug20140111_utf8
all: tests
tests:  $(TESTS:=.runtest)
prepare: compile_examples compile_test
compile_examples:
	make -C ../../examples
compile_test:
	make -C ../
clean: $(TESTS:=.runclean)
%.runtest: | prepare
	make -C $* clean all
%.runclean:
	make -C $* clean

