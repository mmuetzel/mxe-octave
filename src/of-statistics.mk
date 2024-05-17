# This file is part of MXE.
# See index.html for further information.

PKG             := of-statistics
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.6.6
$(PKG)_CHECKSUM := 06738db5426dd6f1542478acaa4ad1d925327a57
$(PKG)_REMOTE_SUBDIR :=
$(PKG)_SUBDIR   := statistics-release-$($(PKG)_VERSION)
$(PKG)_FILE     := statistics-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/gnu-octave/statistics/archive/refs/tags/release-$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     := of-io

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
    $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,gnu-octave,statistics,release-)
endef

define $(PKG)_BUILD
    $(OCTAVE_FORGE_PKG_BUILD)
endef
