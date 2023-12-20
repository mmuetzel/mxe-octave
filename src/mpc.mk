# This file is part of MXE.
# See index.html for further information.

PKG             := mpc
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.3.1
$(PKG)_CHECKSUM := bac1c1fa79f5602df1e29e4684e103ad55714e02
$(PKG)_SUBDIR   := mpc-$($(PKG)_VERSION)
$(PKG)_FILE     := mpc-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://ftp.gnu.org/gnu/mpc/$($(PKG)_FILE)
$(PKG)_DEPS     := build-gcc gmp mpfr

define $(PKG)_UPDATE
    $(WGET) -q -O- 'http://ftp.gnu.org/gnu/$(PKG)/?C=M;O=D' | \
    $(SED) -n 's,.*<a href="$(PKG)-\([0-9][^"]*\)\.tar.*,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
    cd '$(1)' && ./configure \
        --host='$(TARGET)' \
        $(ENABLE_SHARED_OR_STATIC) \
        --prefix='$(HOST_PREFIX)' \
        --with-gmp='$(HOST_PREFIX)/' \
        --with-mpfr='$(HOST_PREFIX)/'
    $(MAKE) -C '$(1)' -j '$(JOBS)'
    $(MAKE) -C '$(1)' -j '$(JOBS)' install
endef
