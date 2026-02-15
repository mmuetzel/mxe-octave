# This file is part of MXE.
# See index.html for further information.

PKG             := opkg-coder
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.11.1
$(PKG)_CHECKSUM := f067c00a3de867d8f8c457a9d96885c0a66feb3b
$(PKG)_SUBDIR   := OctaveCoder-coder-$($(PKG)_VERSION)
$(PKG)_FILE     := coder-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/shsajjadi/OctaveCoder/releases/download/coder-$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_DEPS     := 

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
  $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,shsajjadi,OctaveCoder,coder-)
endef

define $(PKG)_BUILD
  $(OCTAVE_FORGE_PKG_BUILD)
endef
