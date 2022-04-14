# This file is part of MXE.
# See index.html for further information.

PKG             := of-optim
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.6.2
$(PKG)_CHECKSUM := 6f29759288f7ce6df01868f99bb09bac26f8d265
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
    $(OCTAVE_FORGE_PKG_BUILD)
endef
