# This file is part of MXE.
# See index.html for further information.

PKG             := of-strings
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.3.1
$(PKG)_CHECKSUM := 7aeb2ab18bc9623761021423f13d1ba2cbb47301
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
  cd $(1)/src && autoreconf -fiv
  $(OCTAVE_FORGE_PKG_BUILD)
endef
