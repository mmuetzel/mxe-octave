# This file is part of MXE.
# See index.html for further information.

PKG             := fontconfig
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.18.2
$(PKG)_CHECKSUM := 25788eb8e305ea2be8c674eba9cad24db93110f9
$(PKG)_SUBDIR   := fontconfig-$($(PKG)_VERSION)
$(PKG)_FILE     := fontconfig-$($(PKG)_VERSION).tar.bz2
$(PKG)_URL      := https://gitlab.freedesktop.org/fontconfig/fontconfig/-/archive/$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_DEPS     := build-meson build-ninja freetype expat gettext libiconv
ifeq ($(MXE_WINDOWS_BUILD),no)
  $(PKG)_DEPS += util-linux
endif

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://gitlab.freedesktop.org/fontconfig/fontconfig/tags' | \
    $(SED) -n "s,.*<a [^>]\+>v\?\([0-9]\+\.[0-9.]\+\)<.*,\1,p" | \
    $(SORT) -Vr | \
    head -1
endef

ifeq ($(MXE_NATIVE_BUILD),no)
  $(PKG)_MESON_TOOLCHAIN_FILE := --cross-file '$(HOST_PREFIX)/share/meson/cross/mxe-conf.ini'
else
  $(PKG)_MESON_TOOLCHAIN_FILE := --native-file '$(HOST_PREFIX)/share/meson/native/mxe-conf.ini'
endif

define $(PKG)_BUILD
    cd '$(1)' && meson $(1)/.build \
      $($(PKG)_MESON_TOOLCHAIN_FILE) \
      $($(PKG)_MESON_CONFIG_FLAGS) \
      -Dprefix='$(HOST_PREFIX)'  \
      -Dtests=disabled \
      -Ddoc=disabled
    cd '$(1)/.build' && DESTDIR=$(3) ninja -j $(JOBS)
    cd '$(1)/.build' && DESTDIR=$(3) ninja -j 1 install
endef
