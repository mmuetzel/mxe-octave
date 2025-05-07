# This file is part of MXE.
# See index.html for further information.

PKG             := of-fl-core
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.0.2
$(PKG)_CHECKSUM := acd0d113afe6c8c525acf5e232e43a59f501bb58
$(PKG)_REMOTE_SUBDIR := 
$(PKG)_SUBDIR   := fl-core-$($(PKG)_VERSION)
$(PKG)_FILE     := fl-core-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := http://$(SOURCEFORGE_MIRROR)/octave/$($(PKG)_FILE)?download
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
