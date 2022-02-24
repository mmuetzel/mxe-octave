# This file is part of MXE.
# See index.html for further information.

PKG             := of-sockets
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.3.0
$(PKG)_CHECKSUM := 58e66d53528270756547f27828b442f2c775c119
$(PKG)_REMOTE_SUBDIR := 
$(PKG)_SUBDIR   := sockets-$($(PKG)_VERSION)
$(PKG)_FILE     := sockets-$($(PKG)_VERSION).tar.gz
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
