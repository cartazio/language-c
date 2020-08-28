# Configuration for test builds

ifndef HC
	HC=cabal v2-exec ghc --
endif

ifndef OPT
	OPT = -O -rtsopts
endif
HFLAGS = $(OPT)
ifdef PROFILE
	HFLAGS += -prof -auto-all
	SUFFIX="_p"
ifdef BUILD_DIR
	BUILD_DIR=$(BUILD_DIR)$(SUFFIX)
endif
endif

ifdef BUILD_DIR
	HFLAGS+=-hidir $(BUILD_DIR) -odir $(BUILD_DIR)
endif

VERSION?=$(shell cat $(PROJECT_DIR)/language-c.cabal | grep '^Version:' | sed  -E 's/[ \t]+/ /g' | cut -sd' ' -f2)
