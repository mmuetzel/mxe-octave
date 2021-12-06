# This file is part of MXE.
# See index.html for further information.

PKG             := of-audio
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.0.4
$(PKG)_CHECKSUM := 0268406b63582832a8015a82399c1654531d0c04
$(PKG)_REMOTE_SUBDIR := 
$(PKG)_SUBDIR   := audio-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_SUBDIR).tar.gz
$(PKG)_URL      := '$(OCTAVE_FORGE_BASE_URL)/$($(PKG)_FILE)/download'
$(PKG)_DEPS     := rtmidi

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
    $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

define $(PKG)_UPDATE
    $(OCTAVE_FORGE_PKG_UPDATE)
endef

define $(PKG)_BUILD
    $(OCTAVE_FORGE_PKG_BUILD)
endef
