# This file is part of MXE.
# See index.html for further information.

PKG             := of-control
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.0.0
$(PKG)_CHECKSUM := ff6147e7681cb7c03c2db3cd0a66d29867e0d0df
$(PKG)_REMOTE_SUBDIR := 
$(PKG)_SUBDIR   := control-$($(PKG)_VERSION)
$(PKG)_FILE     := control-$($(PKG)_VERSION).tar.gz
#$(PKG)_URL      := https://github.com/gnu-octave/pkg-control/archive/refs/tags/control-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/gnu-octave/pkg-control/releases/download/control-$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_DEPS     := 

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
    $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,gnu-octave,pkg-control,control-)
endef

define $(PKG)_BUILD
    $(OCTAVE_FORGE_PKG_BUILD)
endef
