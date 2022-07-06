# This file is part of MXE.
# See index.html for further information.

PKG             := of-symbolic
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.0.0
$(PKG)_CHECKSUM := efdc11c07916b92eebac93128e07806867f6f956
$(PKG)_REMOTE_SUBDIR := 
$(PKG)_SUBDIR   := octsympy-$($(PKG)_VERSION)
$(PKG)_FILE     := symbolic-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/cbm755/octsympy/archive/refs/tags/v$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     := 

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
    $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

ifeq ($(MXE_WINDOWS_BUILD),yes)
    $(PKG)_DEPS += python-sympy
endif

define $(PKG)_UPDATE
    $(OCTAVE_FORGE_PKG_UPDATE)
endef

define $(PKG)_BUILD
    $(OCTAVE_FORGE_PKG_BUILD)
endef
