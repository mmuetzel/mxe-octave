# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := libtasn1
$(PKG)_VERSION  := 4.19.0
$(PKG)_CHECKSUM := 9c4b6616de65513a0a4d27e0b7f25184391ca8fd
$(PKG)_SUBDIR   := libtasn1-$($(PKG)_VERSION)
$(PKG)_FILE     := libtasn1-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://ftp.gnu.org/gnu/libtasn1/$($(PKG)_FILE)
$(PKG)_DEPS     := 

define $(PKG)_UPDATE
    $(WGET) -q -O- https://ftp.gnu.org/gnu/libtasn1/ | \
    $(SED) -n 's,.*libtasn1-\([1-9]\+\(\.[0-9]\+\)\+\).*,\1,p' | \
    $(SORT) -V | \
    tail -1
endef

define $(PKG)_BUILD
    cd '$(1)' && ./configure \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
	$(ENABLE_SHARED_OR_STATIC) \
	--prefix='$(HOST_PREFIX)'
    $(MAKE) -C '$(1)' -j '$(JOBS)' 
    $(MAKE) -C '$(1)' -j 1 install $(MXE_DISABLE_PROGS) $(MXE_DISABLE_DOCS) DESTDIR='$(3)'
endef
