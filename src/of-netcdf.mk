# This file is part of MXE.
# See index.html for further information.

PKG             := of-netcdf
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.0.19
$(PKG)_CHECKSUM := a69ebecf45f66fc67425544a9c2204019436c663
$(PKG)_REMOTE_SUBDIR := 
$(PKG)_SUBDIR   := netcdf-$($(PKG)_VERSION)
$(PKG)_FILE     := netcdf-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/gnu-octave/octave-netcdf/releases/download/v$($(PKG)_VERSION)/$($(PKG)_SUBDIR).tar.gz
$(PKG)_DEPS     := netcdf

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
    $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,gnu-octave,octave-netcdf,v)
endef

define $(PKG)_BUILD
    $(OCTAVE_FORGE_PKG_BUILD)
endef
