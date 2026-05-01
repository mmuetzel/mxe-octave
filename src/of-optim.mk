# This file is part of MXE.
# See index.html for further information.

PKG             := of-optim
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.6.3
$(PKG)_CHECKSUM := e968cfd057d5cd277786313a6c20073335e71bfc
$(PKG)_REMOTE_SUBDIR := 
$(PKG)_SUBDIR   := optim-$($(PKG)_VERSION)
$(PKG)_FILE     := optim-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := '$(OCTAVE_FORGE_BASE_URL)/$($(PKG)_FILE)/download'
$(PKG)_DEPS     := 

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
  $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

define $(PKG)_UPDATE
  $(OCTAVE_FORGE_PKG_UPDATE)
endef

define $(PKG)_BUILD
  cd $(1)/src && autoreconf -fiv
  $(OCTAVE_FORGE_PKG_BUILD)
endef
