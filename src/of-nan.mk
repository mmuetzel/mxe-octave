# This file is part of MXE.
# See index.html for further information.

PKG             := of-nan
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.6.1
$(PKG)_CHECKSUM := 02518f20c6d61dc1b61550695dbe0adaf5a922f9
$(PKG)_REMOTE_SUBDIR := 
$(PKG)_SUBDIR   := nan-$($(PKG)_VERSION)
$(PKG)_FILE     := nan-$($(PKG)_VERSION).tar.gz
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
