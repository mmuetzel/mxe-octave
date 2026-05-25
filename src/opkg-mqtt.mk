# This file is part of MXE.
# See index.html for further information.

PKG             := opkg-mqtt
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.0.7
$(PKG)_CHECKSUM := 7e27a1ea51c113fd03931534d913805945301dff
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
  cd $(1)/src && autoreconf -fiv
  $(OCTAVE_FORGE_PKG_BUILD)
endef
