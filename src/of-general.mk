# This file is part of MXE.
# See index.html for further information.

PKG             := of-general
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.1.4
$(PKG)_CHECKSUM := 6cba387e87092b47d594d64ac326f3a2a4e3a157
$(PKG)_REMOTE_SUBDIR := 
$(PKG)_SUBDIR   := general-$($(PKG)_VERSION)
$(PKG)_FILE     := general-$($(PKG)_VERSION).tar.gz
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
