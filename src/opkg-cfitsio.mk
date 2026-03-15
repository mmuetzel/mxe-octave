# This file is part of MXE.
# See index.html for further information.

PKG             := opkg-cfitsio
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.0.8
$(PKG)_CHECKSUM := cc0e17ef1d48ac43c35e77be0c63d77cd780988f
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
  $(OCTAVE_FORGE_PKG_BUILD)
endef
