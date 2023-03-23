# This file is part of MXE.
# See index.html for further information.

PKG             := libpaper
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.1.29
$(PKG)_CHECKSUM := 2152e07102931b0488a53b4fcad921aa02c5034b
$(PKG)_SUBDIR   := libpaper-$($(PKG)_VERSION)
$(PKG)_FILE     := libpaper_$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := http://ftp.debian.org/debian/pool/main/libp/$(PKG)/$($(PKG)_FILE)
$(PKG)_URL_2    := http://linux.mirrors.es.net/pub/ubuntu/pool/main/libp/$(PKG)/$($(PKG)_FILE)
$(PKG)_DEPS     :=

define $(PKG)_UPDATE
    $(WGET) -q -O- 'http://packages.debian.org/unstable/source/libpaper' | \
    $(SED) -n 's,.*libpaper_\([0-9][^>]*\)\.tar.*,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
    cd '$(1)' && autoreconf -fi && ./configure \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        $(ENABLE_SHARED_OR_STATIC) \
        --prefix='$(HOST_PREFIX)'
    $(MAKE) -C '$(1)' -j '$(JOBS)' install DESTDIR='$(3)' $(MXE_DISABLE_DOCS) $(MXE_DISABLE_PROGS)
endef
