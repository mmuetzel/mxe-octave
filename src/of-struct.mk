# This file is part of MXE.
# See index.html for further information.

PKG             := of-struct
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.0.18
$(PKG)_CHECKSUM := 2494d826f609aca8540c33f907559ff29d6a31a2
$(PKG)_REMOTE_SUBDIR := 
$(PKG)_SUBDIR   := struct-$($(PKG)_VERSION)
$(PKG)_FILE     := struct-$($(PKG)_VERSION).tar.gz
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
