# This file is part of MXE.
# See index.html for further information.

PKG             := of-symbolic
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.2.1
$(PKG)_CHECKSUM := 27e1dbca58dd845ca4751b1b47a0c4192f076b5c
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
