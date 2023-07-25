# This file is part of MXE.
# See index.html for further information.

PKG             := opkg-mqtt
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.0.4
$(PKG)_CHECKSUM := 01d9b12a4b90be0286c48099e9dc7b4fa1b127ff
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
