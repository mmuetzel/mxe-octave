# This file is part of MXE.
# See index.html for further information.

PKG             := of-statistics
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.8.2
$(PKG)_CHECKSUM := 827e9ea3776c35846898e07b12181c74c714c83c
$(PKG)_REMOTE_SUBDIR :=
$(PKG)_SUBDIR   := statistics-release-$($(PKG)_VERSION)
$(PKG)_FILE     := statistics-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/gnu-octave/statistics/archive/refs/tags/release-$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     := opkg-datatypes

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
    $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,gnu-octave,statistics,release-)
endef

define $(PKG)_BUILD
    $(OCTAVE_FORGE_PKG_BUILD)
endef
