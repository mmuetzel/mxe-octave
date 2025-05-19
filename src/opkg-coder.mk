# This file is part of MXE.
# See index.html for further information.

PKG             := opkg-coder
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.10.1
$(PKG)_CHECKSUM := a7deff40b26a1f607b0618029bc94d7d3aaf7b75
$(PKG)_SUBDIR   := OctaveCoder-coder-$($(PKG)_VERSION)
$(PKG)_FILE     := coder-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/shsajjadi/OctaveCoder/releases/download/$($(PKG)_SUBDIR)/$($(PKG)_FILE)
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
