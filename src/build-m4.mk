# This file is part of MXE.
# See index.html for further information.

PKG             := build-m4
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.4.20
$(PKG)_CHECKSUM := 025df51430845178f926b20a078f994eefaa50fd
$(PKG)_SUBDIR   := m4-$($(PKG)_VERSION)
$(PKG)_FILE     := m4-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := https://ftp.gnu.org/gnu/m4/$($(PKG)_FILE)
$(PKG)_DEPS     := 

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://ftp.gnu.org/gnu/m4/?C=M;O=D' | \
    $(SED) -n 's,.*<a href="m4-\([0-9\.]*\)\.tar.*,\1,p' | \
    $(SORT) -V |
    tail -1
endef

define $(PKG)_BUILD
    mkdir '$(1).build'
    cd    '$(1).build' && '$(1)/configure' \
        --prefix='$(BUILD_TOOLS_PREFIX)'
    $(MAKE) -C '$(1).build' -j '$(JOBS)'
    $(MAKE) -C '$(1).build' -j 1 install DESTDIR='$(3)'
endef
