# Build examples
BINARIES=ParseAndPrint ScanFile SearchDef TypeCheck ComputeSize DumpAst

PROJECT_DIR=..
BIN_DIR=.

all: build
build:
	cabal v2-build
	cabal v2-install --install-method symlink --overwrite-policy always --installdir $(BIN_DIR)

demo_compute_size: ComputeSize
	gcc -DDEBUG compute_size.c -o compute_size.bin && ./compute_size.bin
	./ComputeSize 'comp' compute_size.c | gcc -x c -o compute_size_hs.bin - && \
	  ./compute_size_hs.bin
ComputeSize:
	echo "Please run make build first" >&2
	exit 1

clean:
	rm -f $(addprefix $(BIN_DIR)/, $(BINARIES)) compute_size.bin compute_size_hs.bin
	cabal v2-clean
