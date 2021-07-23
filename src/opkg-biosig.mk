# This file is part of MXE.
# See index.html for further information.

PKG             := opkg-biosig
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.3.1
$(PKG)_CHECKSUM := 69b317a5a1ee973e46d7d1eb76467d5ee4a3f92a
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
