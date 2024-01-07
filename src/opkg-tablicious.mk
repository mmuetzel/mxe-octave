# This file is part of MXE.
# See index.html for further information.

PKG             := opkg-tablicious
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.3.7
$(PKG)_CHECKSUM := 93c802601bb65f7de4bb10889cbb8494b79ea031
$(PKG)_SUBDIR   := tablicious-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_SUBDIR).tar.gz
x$(PKG)_URL      := https://github.com/apjanke/octave-tablicious/archive/v$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/apjanke/octave-tablicious/releases/download/v0.3.7/tablicious-0.3.7.tar.gz
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
