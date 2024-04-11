# This file is part of MXE.
# See index.html for further information.

PKG             := opkg-mqtt
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.0.5
$(PKG)_CHECKSUM := 8d046a75fb762ddc319e13ef4474e4221e35b658
$(PKG)_SUBDIR   := octave-mqtt-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_SUBDIR).tar.gz
$(PKG)_URL      := https://github.com/gnu-octave/octave-mqtt/releases/download/release-$($(PKG)_VERSION)/$($(PKG)_SUBDIR).tar.gz
$(PKG)_DEPS     := paho-mqtt-c

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
  $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,gnu-octave,octave-mqtt,release-)
endef

define $(PKG)_BUILD
  $(OCTAVE_FORGE_PKG_BUILD)
endef
