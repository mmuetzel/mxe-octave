# This file is part of MXE.
# See index.html for further information.

PKG             := gcc-mpfr
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.1.1
$(PKG)_CHECKSUM := 2355e921d6c97c898cfe7a57dd7e72725f1fded4
$(PKG)_SUBDIR   := mpfr-$($(PKG)_VERSION)
$(PKG)_FILE     := mpfr-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := ftp://ftp.gnu.org/gnu/mpfr/$($(PKG)_FILE)
$(PKG)_URL_2    := https://www.mpfr.org/mpfr-$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_DEPS     := gcc-gmp

define $(PKG)_UPDATE
    echo 'Warning: Updates are temporarily disabled for package $(PKG).' >&2;
    echo $(mpfr_VERSION)
endef

define $(PKG)_BUILD
    mkdir '$(1).build'
    cd    '$(1).build' && '$(1)/configure' \
        --prefix='$(BUILD_TOOLS_PREFIX)' \
        --disable-shared \
        --with-gmp='$(BUILD_TOOLS_PREFIX)'
    $(MAKE) -C '$(1).build' -j '$(JOBS)'
    $(MAKE) -C '$(1).build' -j 1 install
endef
