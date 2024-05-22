# This file is part of MXE.
# See index.html for further information.

PKG             := xcb
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.15
$(PKG)_CHECKSUM := 5b664321e61e6af4402795c86bd1d2a0e7b82fbc
$(PKG)_SUBDIR   := libxcb-$($(PKG)_VERSION)
$(PKG)_FILE     := libxcb-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := http://www.x.org/archive/individual/xcb/$($(PKG)_FILE)
$(PKG)_DEPS     := build-python pthread-stubs util-macros xau xcb-proto

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://www.x.org/archive/individual/xcb/' | \
    $(SED) -n 's,.*<a href="libxcb-\([0-9\.]*\)\.tar.gz".*,\1,p' | \
    $(SORT) -V |
    tail -1
endef

ifeq ($(MXE_WINDOWS_BUILD),yes)
  define $(PKG)_BUILD
  endef
else
  define $(PKG)_BUILD
    mkdir '$(1)/.build'
    cd '$(1)/.build' && $($(PKG)_CONFIGURE_ENV) PYTHON=$(MXE_PYTHON) '$(1)/configure' \
        $(CONFIGURE_CPPFLAGS) $(CONFIGURE_LDFLAGS) \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        --prefix='$(HOST_PREFIX)' --disable-docs --disable-devel-docs \
        && $(CONFIGURE_POST_HOOK)

    $(MAKE) -C '$(1)/.build' -j '$(JOBS)' install DESTDIR='$(3)'
  endef
endif
