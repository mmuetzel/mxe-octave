# This file is part of MXE.
# See index.html for further information.

PKG             := glu
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 9.0.2
$(PKG)_CHECKSUM := d56833045bf49218fbaf6047371c14ff852cecfe
$(PKG)_SUBDIR   := glu-$($(PKG)_VERSION)
$(PKG)_FILE     := glu-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := ftp://ftp.freedesktop.org/pub/mesa/glu/$($(PKG)_FILE)
$(PKG)_DEPS     := mesa

define $(PKG)_UPDATE
    echo 'Warning: Updates are temporarily disabled for package $(PKG).' >&2;
    echo $($(PKG)_VERSION)
endef

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
