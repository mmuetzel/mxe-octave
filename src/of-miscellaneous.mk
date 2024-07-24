# This file is part of MXE.
# See index.html for further information.

PKG             := of-miscellaneous
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.3.1
$(PKG)_CHECKSUM := 58a39088bcfa1a89ebe3e8aa6081b697e89e4fb3
$(PKG)_REMOTE_SUBDIR := 
$(PKG)_SUBDIR   := miscellaneous-$($(PKG)_VERSION)
$(PKG)_FILE     := miscellaneous-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := '$(OCTAVE_FORGE_BASE_URL)/$($(PKG)_FILE)/download'
$(PKG)_DEPS     := of-general units

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
    $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

define $(PKG)_UPDATE
    $(OCTAVE_FORGE_PKG_UPDATE)
endef

define $(PKG)_BUILD
    $(call OCTAVE_FORGE_PKG_BUILD,$(1),$(2),$(3),UNITS_AVAILABLE=yes)
endef
