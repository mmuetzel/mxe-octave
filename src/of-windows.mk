# This file is part of MXE.
# See index.html for further information.

PKG             := of-windows
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.7.0
$(PKG)_CHECKSUM := e88e2d8673b3b2c04397d947c7024ef52f5e560b
$(PKG)_REMOTE_SUBDIR :=
$(PKG)_SUBDIR   := windows-$($(PKG)_VERSION)
$(PKG)_FILE     := windows-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/gnu-octave/octave-windows/releases/download/release-$($(PKG)_VERSION)/$($(PKG)_SUBDIR).tar.gz
$(PKG)_DEPS     :=

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
    $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,gnu-octave,octave-windows,release-)
endef

define $(PKG)_BUILD
    $(OCTAVE_FORGE_PKG_BUILD)
endef
