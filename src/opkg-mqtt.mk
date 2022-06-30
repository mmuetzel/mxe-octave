# This file is part of MXE.
# See index.html for further information.

PKG             := opkg-mqtt
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.0.1
$(PKG)_CHECKSUM := 4b8c95fe20b4e67747b6d2712db1965d0baaba4a
$(PKG)_SUBDIR   := octave-mqtt-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_SUBDIR).tar.gz
$(PKG)_URL      := https://downloads.sourceforge.net/project/octave-mqtt/v$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_DEPS     := paho-mqtt-c

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
  $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

define $(PKG)_UPDATE
  echo 'Warning: Updates are temporarily disabled for package $(PKG).' >&2;
  echo $($(PKG)_VERSION)
endef

define $(PKG)_BUILD
  $(OCTAVE_FORGE_PKG_BUILD)
endef
