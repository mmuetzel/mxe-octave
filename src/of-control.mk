# This file is part of MXE.
# See index.html for further information.

PKG             := of-control
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.6.1
$(PKG)_CHECKSUM := ae5e5ab6ff451e3708fa309ec4ee03a320f5d860
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
