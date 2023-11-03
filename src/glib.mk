# This file is part of MXE.
# See index.html for further information.

PKG             := glib
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.78.1
$(PKG)_CHECKSUM := eb732d27f90512231c14b88e4ee80543a643dff3
$(PKG)_SUBDIR   := glib-$($(PKG)_VERSION)
$(PKG)_FILE     := glib-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := http://ftp.gnome.org/pub/gnome/sources/glib/$(call SHORT_PKG_VERSION,$(PKG))/$($(PKG)_FILE)
$(PKG)_DEPS     := gettext pcre2 libiconv zlib libffi dbus build-meson

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://github.com/GNOME/glib/tags' | \
    $(SED) -n 's|.*releases/tag/\([^"]*\).*|\1|p' | \
    $(SORT) -Vr | \
    head -1
endef

# FIXME: Should this be defined in the top-level Makefile?
ifeq ($(MXE_NATIVE_BUILD),yes)
  MESON_TOOLCHAIN_FILE := $(HOST_PREFIX)/share/meson/native/mxe-conf.ini
  $(PKG)_MESON_TOOLCHAIN_FILE := --native-file='$(MESON_TOOLCHAIN_FILE)'
else
  MESON_TOOLCHAIN_FILE := $(HOST_PREFIX)/share/meson/cross/mxe-conf.ini
  $(PKG)_MESON_TOOLCHAIN_FILE := --cross-file='$(MESON_TOOLCHAIN_FILE)'
endif

ifeq ($(BUILD_SHARED),yes)
  $(PKG)_MESON_CONFIG_FLAGS += -Ddefault_library=shared
else
  $(PKG)_MESON_CONFIG_FLAGS += -Ddefault_library=static
endif

define $(PKG)_BUILD
    rm -f '$(HOST_BINDIR)/glib-*'

    PKG_CONFIG='$(MXE_PKG_CONFIG)' \
    PKG_CONFIG_PATH='$(PKG_CONFIG_PATH)' \
    meson setup --errorlogs \
      $($(PKG)_MESON_TOOLCHAIN_FILE) \
      --wrap-mode=nodownload \
      --prefix='$(HOST_PREFIX)' \
      -Dlibelf=disabled \
      -Dtests=false \
      -Dforce_posix_threads=true \
      $($(PKG)_MESON_CONFIG_FLAGS) \
       $(1)/.build $(1)

    ninja -C '$(1)/.build' -j '$(JOBS)'
    ninja -C '$(1)/.build' -j '$(JOBS)' install
endef

