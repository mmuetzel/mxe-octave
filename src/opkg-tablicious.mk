# This file is part of MXE.
# See index.html for further information.

PKG             := opkg-tablicious
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.4.6
$(PKG)_CHECKSUM := c2acb1cb1d53ad367238a48a23c7bf8e461c6ec2
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
