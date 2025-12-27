# This file is part of MXE.
# See index.html for further information.

PKG             := of-sockets
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.5.0
$(PKG)_CHECKSUM := 0c36b18221d16103c0a6566cbc94fafe99af59ad
$(PKG)_REMOTE_SUBDIR := 
$(PKG)_SUBDIR   := sockets-$($(PKG)_VERSION)
$(PKG)_FILE     := sockets-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := '$(OCTAVE_FORGE_BASE_URL)/$($(PKG)_FILE)/download'
$(PKG)_URL      := https://github.com/gnu-octave/octave-sockets/releases/download/release-$($(PKG)_VERSION)/$($(PKG)_SUBDIR).tar.gz
$(PKG)_DEPS     := 

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
    $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,gnu-octave,octave-sockets,release-)
endef

define $(PKG)_BUILD
    $(OCTAVE_FORGE_PKG_BUILD)
endef
