# This file is part of MXE.
# See index.html for further information.

PKG             := of-strings
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.3.0
$(PKG)_CHECKSUM := 9ee4cda53ec0b63b9e96c36a0c0f69bfb2a6c472
$(PKG)_REMOTE_SUBDIR := 
$(PKG)_SUBDIR   := strings-$($(PKG)_VERSION)
$(PKG)_FILE     := strings-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := '$(OCTAVE_FORGE_BASE_URL)/$($(PKG)_FILE)/download'
$(PKG)_DEPS     := 

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
    $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

define $(PKG)_UPDATE
    $(OCTAVE_FORGE_PKG_UPDATE)
endef

define $(PKG)_BUILD
    $(OCTAVE_FORGE_PKG_BUILD)
endef
