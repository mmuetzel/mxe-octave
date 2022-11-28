# This file is part of MXE.
# See index.html for further information.

PKG             := mpfr
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.1.1
$(PKG)_CHECKSUM := 2355e921d6c97c898cfe7a57dd7e72725f1fded4
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := ftp://ftp.gnu.org/gnu/mpfr/$($(PKG)_FILE)
$(PKG)_URL_2    := https://www.mpfr.org/mpfr-$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_DEPS     := build-gcc gmp

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://www.mpfr.org/mpfr-current/' | \
    $(SED) -n 's,<title>.*version \([0-9][^<]*\).*,\1,p' | \
    $(SORT) -V | \
    tail -1
endef

define $(PKG)_BUILD
    cd '$(1)' && ./configure \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        $(ENABLE_SHARED_OR_STATIC) \
        --prefix='$(HOST_PREFIX)' \
        --enable-threads=win32 \
        --with-gmp-include='$(HOST_INCDIR)'
        --with-gmp-lib='$(HOST_LIBDIR)'
    $(MAKE) -C '$(1)' -j '$(JOBS)' $(MXE_DISABLE_DOCS)
    $(MAKE) -C '$(1)' -j '$(JOBS)' $(MXE_DISABLE_DOCS) install DESTDIR='$(3)'
    if [ "$(ENABLE_DEP_DOCS)" == "no" ]; then \
       rm -rf "$(3)$(HOST_PREFIX)/share/doc/mpfr"; \
    fi
endef
