# This file is part of MXE.
# See index.html for further information.

PKG             := isl
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.24
$(PKG)_CHECKSUM := b0c46cc1c4fb1658def8d3c4c702a01049ea795e
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://libisl.sourceforge.io/$($(PKG)_FILE)
$(PKG)_URL_2    := https://gcc.gnu.org/pub/gcc/infrastructure/$($(PKG)_FILE)
$(PKG)_DEPS     := build-gcc gmp

$(PKG)_EXTRA_MAKE_FLAGS := LDFLAGS='-no-undefined'

# stick to tested versions from gcc
define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://gcc.gnu.org/pub/gcc/infrastructure/' | \
    $(SED) -n 's,.*isl-\([0-9][^>]*\)\.tar.*,\1,p' | \
    $(SORT) -V |
    tail -1
endef

define $(PKG)_BUILD
    cd '$(1)' && mkdir '$(1)/.build'
    cd '$(1)/.build' && '$(1)/configure' \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        $(ENABLE_SHARED_OR_STATIC) \
        --prefix='$(HOST_PREFIX)' \
        --with-gmp-prefix='$(HOST_PREFIX)'
    $(MAKE) -C '$(1)/.build' -j '$(JOBS)' $($(PKG)_EXTRA_MAKE_FLAGS)
    $(MAKE) -C '$(1)/.build' -j '$(JOBS)' $($(PKG)_EXTRA_MAKE_FLAGS) install
endef
