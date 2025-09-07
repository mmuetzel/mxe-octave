# This file is part of MXE.
# See index.html for further information.

PKG             := opkg-tablicious
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.4.5
$(PKG)_CHECKSUM := d92110ac29b1a11098a241988985192b09768f73
$(PKG)_SUBDIR   := tablicious-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_SUBDIR).tar.gz
$(PKG)_URL      := https://github.com/apjanke/octave-tablicious/releases/download/v$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_DEPS     := 

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
  $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,apjanke,octave-tablicious,v)
endef

define $(PKG)_BUILD
  $(OCTAVE_FORGE_PKG_BUILD)
endef
