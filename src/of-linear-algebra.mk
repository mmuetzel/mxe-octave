# This file is part of MXE.
# See index.html for further information.

PKG             := of-linear-algebra
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.2.4
$(PKG)_CHECKSUM := 25c8064678c8d2f9e9203967b9bed8cfbfbedf66
$(PKG)_REMOTE_SUBDIR :=
$(PKG)_SUBDIR   := linear-algebra-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_SUBDIR).tar.gz
$(PKG)_URL      := '$(OCTAVE_FORGE_BASE_URL)/$($(PKG)_FILE)/download'
$(PKG)_DEPS     :=

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
    $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

define $(PKG)_UPDATE
    $(OCTAVE_FORGE_PKG_UPDATE)
endef

define $(PKG)_BUILD
    $(OCTAVE_FORGE_PKG_BUILD)
endef
