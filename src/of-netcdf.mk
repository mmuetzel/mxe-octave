# This file is part of MXE.
# See index.html for further information.

PKG             := of-netcdf
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.0.16
$(PKG)_CHECKSUM := 7eece84184f4cea73d0aa57dca7f95e20f808e41
$(PKG)_REMOTE_SUBDIR := 
$(PKG)_SUBDIR   := netcdf-$($(PKG)_VERSION)
$(PKG)_FILE     := netcdf-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := '$(OCTAVE_FORGE_BASE_URL)/$($(PKG)_FILE)/download'
$(PKG)_DEPS     := netcdf

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
    $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

define $(PKG)_UPDATE
    $(OCTAVE_FORGE_PKG_UPDATE)
endef

define $(PKG)_BUILD
    $(OCTAVE_FORGE_PKG_BUILD)
endef
