# This file is part of MXE.
# See index.html for further information.

PKG             := gcc-isl
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.22.1
$(PKG)_CHECKSUM := ce66c4415906bf2c16a8f09f31383f4fe0991531
$(PKG)_SUBDIR   := isl-isl-$($(PKG)_VERSION)-788faca
$(PKG)_FILE     := isl-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://repo.or.cz/isl.git/snapshot/$($(PKG)_FILE)
$(PKG)_DEPS     := gcc-gmp

define $(PKG)_UPDATE
    echo 'Warning: Updates are temporarily disabled for package $(PKG).' >&2;
    echo $(isl_VERSION)
endef

define $(PKG)_BUILD
    cd '$(1)' && ./autogen.sh
    mkdir '$(1).build'
    cd    '$(1).build' && '$(1)/configure' \
        --prefix='$(BUILD_TOOLS_PREFIX)' \
        --disable-shared \
        --with-gmp-prefix='$(BUILD_TOOLS_PREFIX)'
    $(MAKE) -C '$(1).build' -j '$(JOBS)'
    $(MAKE) -C '$(1).build' -j 1 install
endef
