# This file is part of MXE.
# See index.html for further information.

PKG             := of-nan
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.7.0
$(PKG)_CHECKSUM := c504fc5403a78dc90de4a294bb6745561ae0e69e
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
