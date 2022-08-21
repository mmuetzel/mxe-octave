# This file is part of MXE.
# See index.html for further information.

PKG             := opkg-mqtt
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.0.3
$(PKG)_CHECKSUM := b5d4745e7ab56f500ae00c17788843c024475847
$(PKG)_SUBDIR   := octave-mqtt-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_SUBDIR).tar.gz
$(PKG)_URL      := https://downloads.sourceforge.net/project/octave-mqtt/v$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_DEPS     := paho-mqtt-c

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
  $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

define $(PKG)_UPDATE
    $(WGET) -q -O- https://sourceforge.net/p/octave-mqtt/code/ci/default/tree/ | \
    $(SED) -n 's|.*code/ci/release-\([0-9][0-9.]*\)/tree.*|\1|p' | $(SORT) -V | \
    tail -1
endef

define $(PKG)_BUILD
  $(OCTAVE_FORGE_PKG_BUILD)
endef
