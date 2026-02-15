# This file is part of MXE.
# See index.html for further information.

PKG             := build-autoconf
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.72
$(PKG)_CHECKSUM := 1d082d999ff4506ec8f92c6ecb9732546f5204fb
$(PKG)_SUBDIR   := autoconf-$($(PKG)_VERSION)
$(PKG)_FILE     := autoconf-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := https://ftp.gnu.org/gnu/autoconf/$($(PKG)_FILE)
$(PKG)_DEPS     :=

ifneq ($(MXE_SYSTEM),msvc)
    ifneq ($(MXE_NATIVE_MINGW_BUILD),yes)
        $(PKG)_DEPS += build-m4
    endif
    $(PKG)_DEPS += build-xz
endif

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://ftp.gnu.org/gnu/autoconf/?C=M;O=D' | \
    $(SED) -n 's,.*<a href="autoconf-\([0-9\.]*\)\.tar.*,\1,p' | \
    $(SORT) -V | \
    tail -1
endef

define $(PKG)_BUILD
    mkdir '$(1).build'
    cd    '$(1).build' && '$(1)/configure' \
        --prefix='$(BUILD_TOOLS_PREFIX)'
    $(MAKE) -C '$(1).build' -j '$(JOBS)'
    $(MAKE) -C '$(1).build' -j 1 install DESTDIR='$(3)'
endef
