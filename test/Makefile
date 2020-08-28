# Build test binaries
BINARIES=CTest CParse CRoundTrip CEquiv RenderTests ReportFatal CheckGccArgs

PROJECT_DIR=..
BIN_DIR=bin

all:
	cabal v2-build
	cabal v2-install --install-method symlink --installdir $(BIN_DIR)

clean:
	rm -f $(addprefix $(BIN_DIR)/, $(BINARIES))
	cabal v2-lean
	make -C harness clean
