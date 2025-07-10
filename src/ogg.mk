# This file is part of MXE.
# See index.html for further information.

PKG             := ogg
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.3.6
$(PKG)_CHECKSUM := 8f50ef58f4d4ba56a0d274b6ba7661066b3d4505
$(PKG)_SUBDIR   := libogg-$($(PKG)_VERSION)
$(PKG)_FILE     := libogg-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := http://downloads.xiph.org/releases/ogg/$($(PKG)_FILE)
$(PKG)_DEPS     :=

define $(PKG)_UPDATE
    $(WGET) -q -O- 'http://www.xiph.org/downloads/' | \
    $(SED) -n 's,.*libogg-\([0-9][^>]*\)\.tar.*,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
    cd '$(1)' && ./configure \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        $(ENABLE_SHARED_OR_STATIC) \
        --prefix='$(HOST_PREFIX)'
    $(MAKE) -C '$(1)' -j '$(JOBS)' $(MXE_DISABLE_PROGS) $(MXE_DISABLE_DOCS)
    $(MAKE) -C '$(1)' -j 1 install $(MXE_DISABLE_PROGS) $(MXE_DISABLE_DOCS)
endef
