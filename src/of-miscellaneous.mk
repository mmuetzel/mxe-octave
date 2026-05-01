# This file is part of MXE.
# See index.html for further information.

PKG             := of-miscellaneous
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.3.2
$(PKG)_CHECKSUM := 2fe35226e5a5e5920b229764311667decbeaceca
$(PKG)_REMOTE_SUBDIR := 
$(PKG)_SUBDIR   := miscellaneous-$($(PKG)_VERSION)
$(PKG)_FILE     := miscellaneous-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/gnu-octave/octave-miscellaneous/releases/download/release-$($(PKG)_VERSION)/$($(PKG)_SUBDIR).tar.gz
$(PKG)_DEPS     := of-general units

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
  $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

define $(PKG)_UPDATE
  $(call GITHUB_PKG_UPDATE,gnu-octave,octave-miscellaneous,release-)
endef

define $(PKG)_BUILD
  cd $(1)/src && autoreconf -fiv
  $(call OCTAVE_FORGE_PKG_BUILD,$(1),$(2),$(3),UNITS_AVAILABLE=yes)
endef
