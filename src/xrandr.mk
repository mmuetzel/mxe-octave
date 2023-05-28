# This file is part of MXE.
# See index.html for further information.

PKG             := xrandr
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.5.3
$(PKG)_CHECKSUM := 7230e6ee8d25e9882618d770008dd3637e6e2171
$(PKG)_SUBDIR   := libXrandr-$($(PKG)_VERSION)
$(PKG)_FILE     := libXrandr-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := http://www.x.org/archive/individual/lib/$($(PKG)_FILE)
$(PKG)_DEPS     := randrproto xext xextproto xrender renderproto

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
