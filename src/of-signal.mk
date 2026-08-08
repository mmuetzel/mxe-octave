# This file is part of MXE.
# See index.html for further information.

PKG             := of-signal
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.4.8
$(PKG)_CHECKSUM := eb0050e804ff099e413c948a5948fac9c6e90f4c
$(PKG)_REMOTE_SUBDIR := 
$(PKG)_SUBDIR   := signal-$($(PKG)_VERSION)
$(PKG)_FILE     := signal-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/gnu-octave/octave-signal/releases/download/$($(PKG)_VERSION)/$($(PKG)_SUBDIR).tar.gz
$(PKG)_DEPS     := of-control

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
    $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,gnu-octave,octave-signal,)
endef

define $(PKG)_BUILD
    $(OCTAVE_FORGE_PKG_BUILD)
endef
