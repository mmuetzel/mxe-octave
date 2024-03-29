# This file is part of MXE.
# See index.html for further information.

PKG             := xcb-util-cursor
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.1.4
$(PKG)_CHECKSUM := bad1de5607d14705b131efd5486c8456fc4d7177
$(PKG)_SUBDIR   := xcb-util-cursor-$($(PKG)_VERSION)
$(PKG)_FILE     := xcb-util-cursor-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := http://www.x.org/archive/individual/xcb/$($(PKG)_FILE)
$(PKG)_DEPS     := xcb xcb-util-image xcb-util-renderutil

ifeq ($(MXE_WINDOWS_BUILD),yes)
  define $(PKG)_BUILD
  endef
else
  define $(PKG)_BUILD
    mkdir '$(1)/.build'
    cd '$(1)/.build' && $($(PKG)_CONFIGURE_ENV) '$(1)/configure' \
        $(CONFIGURE_CPPFLAGS) $(CONFIGURE_LDFLAGS) \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        --prefix='$(HOST_PREFIX)' \
        && $(CONFIGURE_POST_HOOK)

    $(MAKE) -C '$(1)/.build' -j '$(JOBS)' install DESTDIR='$(3)'
  endef
endif
