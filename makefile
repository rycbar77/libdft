LIBDFT_SRC			= libdft
TOOLS_ROOT			= tool
# LIBDFT_TAG_FLAGS	?= -DLIBDFT_TAG_TYPE=libdft_tag_uint8

.PHONY: all
all: dftsrc toolsrc

.PHONY: dftsrc toolsrc
dftsrc: $(LIBDFT_SRC)
	cd $< && CPPFLAGS=$(CPPFLAGS) DFTFLAGS=$(LIBDFT_TAG_FLAGS) make

toolsrc: $(TOOLS_ROOT)
	# cd $< && TARGET=ia32 CPPFLAGS=$(CPPFLAGS) DFTFLAGS=$(LIBDFT_TAG_FLAGS) make
	cd $< && TARGET=intel64 CPPFLAGS=$(CPPFLAGS) DFTFLAGS=$(LIBDFT_TAG_FLAGS) make


.PHONY: clean
clean:
	cd $(LIBDFT_SRC) && make clean
	cd $(TOOLS_ROOT) && make clean
