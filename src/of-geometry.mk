# This file is part of MXE.
# See index.html for further information.

PKG             := of-geometry
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.1.0
$(PKG)_CHECKSUM := cce0768abd7d133bcc7c9999804660c86ef6d1f7
$(PKG)_REMOTE_SUBDIR :=
$(PKG)_SUBDIR   := geometry-$($(PKG)_VERSION)
$(PKG)_FILE     := geometry-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := '$(OCTAVE_FORGE_BASE_URL)/$($(PKG)_FILE)/download'
$(PKG)_DEPS     := of-matgeom

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
    $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

define $(PKG)_UPDATE
    $(OCTAVE_FORGE_PKG_UPDATE)
endef

define $(PKG)_BUILD
    $(OCTAVE_FORGE_PKG_BUILD)
endef

