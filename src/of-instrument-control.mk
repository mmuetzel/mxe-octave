# This file is part of MXE.
# See index.html for further information.

PKG             := of-instrument-control
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.10.1
$(PKG)_CHECKSUM := 804fd6ebd51601611a63ec20241843393ae42857
$(PKG)_REMOTE_SUBDIR := 
$(PKG)_SUBDIR   := instrument-control-$($(PKG)_VERSION)
$(PKG)_FILE     := instrument-control-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := '$(OCTAVE_FORGE_BASE_URL)/$($(PKG)_FILE)/download'
$(PKG)_URL      := https://github.com/gnu-octave/instrument-control/releases/download/release-$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_DEPS     := libmodbus pkg-config

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
    $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,gnu-octave,instrument-control,release-)
endef

define $(PKG)_BUILD
    $(OCTAVE_FORGE_PKG_BUILD)
endef
