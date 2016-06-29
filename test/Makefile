# Build test binaries
PROJECT_DIR=..
BUILD_DIR=build

include config.mk

INCLUDE=-i../test-framework -isrc

all: c_test test_drivers check_args render_tests

test_drivers: parse round_trip equiv report_fatal

# GHC bug: Main sometimes isn't recompiled (6.8.2, 6.8.3, should get fixed in 6.10)
c_test: cabal_build_lib
	$(HC) $(HFLAGS) -o bin/CTest$(SUFFIX) $(INCLUDE) --make src/CTest.hs
parse: cabal_build_lib
	$(HC) $(HFLAGS) -o bin/CParse$(SUFFIX) $(INCLUDE) --make src/CParse.hs
round_trip: cabal_build_lib
	$(HC) $(HFLAGS) -o bin/CRoundTrip$(SUFFIX) $(INCLUDE) --make src/CRoundTrip.hs
equiv: cabal_build_lib
	$(HC) $(HFLAGS) -o bin/CEquiv$(SUFFIX) $(INCLUDE) --make src/CEquiv.hs
render_tests: cabal_build_lib
	$(HC) $(HFLAGS) -o bin/RenderTests$(SUFFIX) $(INCLUDE) --make src/RenderTests.hs
report_fatal: cabal_build_lib clean
	$(HC) $(HFLAGS) -o bin/ReportFatal$(SUFFIX) $(INCLUDE) --make src/ReportFatal.hs
check_args: cabal_build_lib
	$(HC) $(HFLAGS) -o bin/CheckGccArgs$(SUFFIX) $(INCLUDE) --make src/CheckGccArgs.hs
clean:
	rm -rf build/*
cabal_build_lib: ../dist/package.conf.inplace

../dist/package.conf.inplace:
	echo "Please run cabal build first"
	exit 1
