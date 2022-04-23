# This file is part of MXE.
# See index.html for further information.

PKG             := opkg-biosig
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.4.1
$(PKG)_CHECKSUM := db342cd5bd61cda05112b2c6ddceb47992874a8f
$(PKG)_SUBDIR   := biosig4octave-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_SUBDIR).src.tar.gz
$(PKG)_URL      := https://pub.ist.ac.at/~schloegl/biosig/prereleases/$($(PKG)_FILE)
$(PKG)_DEPS     := libbiosig

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
