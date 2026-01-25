# This file is part of MXE.
# See index.html for further information.

PKG             := of-audio
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.0.10
$(PKG)_CHECKSUM := 64916dceae4efd6c42622bbbb9d620c7e4fa6c8a
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
    $(OCTAVE_FORGE_PKG_BUILD)
endef
