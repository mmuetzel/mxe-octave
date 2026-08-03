# This file is part of MXE.
# See index.html for further information.

PKG             := opkg-cfitsio
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.0.9
$(PKG)_CHECKSUM := d69be8fb2fec16751e43d083250b1ac4771f24f5
$(PKG)_SUBDIR   := octave-cfitsio-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_SUBDIR).tar.gz
$(PKG)_URL      := https://downloads.sourceforge.net/project/octave-cfitsio/v$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_URL      := https://github.com/gnu-octave/octave-cfitsio/releases/download/v$($(PKG)_VERSION)/$($(PKG)_SUBDIR).tar.gz
$(PKG)_DEPS     := pkg-config cfitsio

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
  $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

define $(PKG)_UPDATE
  $(call GITHUB_PKG_UPDATE,gnu-octave,octave-cfitsio,v)
endef

define $(PKG)_BUILD
  cd $(1)/src && autoreconf -fiv
  $(OCTAVE_FORGE_PKG_BUILD)
endef
