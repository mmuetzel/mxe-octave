# This file is part of MXE.
# See index.html for further information.

PKG             := of-symbolic
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.2.2
$(PKG)_CHECKSUM := 496dd5ba38ac0eeb08bd0689b3edab5cb3779b2e
$(PKG)_REMOTE_SUBDIR :=
$(PKG)_SUBDIR   := symbolic-$($(PKG)_VERSION)
$(PKG)_FILE     := symbolic-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/gnu-octave/symbolic/releases/download/v$($(PKG)_VERSION)/$($(PKG)_FILE)
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
