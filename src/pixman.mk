# This file is part of MXE.
# See index.html for further information.

PKG             := pixman
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.44.2
$(PKG)_CHECKSUM := fc8407e2af52d1581ab3e31c16ce927a1b3399a8
$(PKG)_SUBDIR   := pixman-$($(PKG)_VERSION)
$(PKG)_FILE     := pixman-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := http://cairographics.org/releases/$($(PKG)_FILE)
$(PKG)_URL_2    := http://www.x.org/archive/individual/lib/$($(PKG)_FILE)
$(PKG)_DEPS     := build-meson build-ninja libpng

ifeq ($(MXE_NATIVE_BUILD),no)
  $(PKG)_MESON_TOOLCHAIN_FILE := --cross-file '$(HOST_PREFIX)/share/meson/cross/mxe-conf.ini'
else
  $(PKG)_MESON_TOOLCHAIN_FILE := --native-file '$(HOST_PREFIX)/share/meson/native/mxe-conf.ini'
endif

ifeq ($(BUILD_SHARED),yes)
  $(PKG)_MESON_CONFIG_FLAGS += -Ddefault_library=shared
else
  $(PKG)_MESON_CONFIG_FLAGS += -Ddefault_library=static
endif


define $(PKG)_UPDATE
    $(WGET) -q -O- 'http://cairographics.org/releases/?C=M;O=D' | \
    $(SED) -n 's,.*"pixman-\([0-9][^"]*\)\.tar.*,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
  cd '$(1)' && \
      meson $(1)/.build \
      $($(PKG)_MESON_TOOLCHAIN_FILE) \
      $($(PKG)_MESON_CONFIG_FLAGS) \
      -Dprefix='$(HOST_PREFIX)' 

  cd '$(1)/.build' && DESTDIR=$(3) ninja -j $(JOBS)
  cd '$(1)/.build' && DESTDIR=$(3) ninja -j 1 install

endef
