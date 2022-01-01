# This file is part of MXE.
# See index.html for further information.

PKG             := of-io
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.6.4
$(PKG)_CHECKSUM := e8c7e9df8624839c634a730a08a0e5efb856735e
$(PKG)_REMOTE_SUBDIR := 
$(PKG)_SUBDIR   := io-$($(PKG)_VERSION)
$(PKG)_FILE     := io-$($(PKG)_VERSION).tar.gz
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
