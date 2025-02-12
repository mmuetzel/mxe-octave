# This file is part of MXE.
# See index.html for further information.

PKG             := of-nurbs
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.4.4
$(PKG)_CHECKSUM := 2d306de2ddb2f4206c905d806cf9d3b0ec08a282
$(PKG)_REMOTE_SUBDIR := 
$(PKG)_SUBDIR   := nurbs-$($(PKG)_VERSION)
$(PKG)_FILE     := nurbs-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := '$(OCTAVE_FORGE_BASE_URL)/$($(PKG)_FILE)/download'
$(PKG)_DEPS     :=
ifeq ($(USE_SYSTEM_GCC),no)
  $(PKG)_DEPS += libgomp
endif

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
    $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

define $(PKG)_UPDATE
    $(OCTAVE_FORGE_PKG_UPDATE)
endef

define $(PKG)_BUILD
    $(OCTAVE_FORGE_PKG_BUILD)
endef
