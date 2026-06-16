# This file is part of MXE.
# See index.html for further information.

PKG             := of-audio
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.0.12
$(PKG)_CHECKSUM := c41e448948851b333e88f0d6dfea01d4ab5fd668
$(PKG)_REMOTE_SUBDIR := 
$(PKG)_SUBDIR   := audio-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_SUBDIR).tar.gz
$(PKG)_URL      := https://github.com/gnu-octave/octave-audio/releases/download/release-$($(PKG)_VERSION)/$($(PKG)_SUBDIR).tar.gz
$(PKG)_DEPS     := rtmidi

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
  $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

define $(PKG)_UPDATE
  $(call GITHUB_PKG_UPDATE,gnu-octave,octave-audio,release-)
endef

define $(PKG)_BUILD
  cd $(1)/src && autoreconf -fiv
  $(OCTAVE_FORGE_PKG_BUILD)
endef
