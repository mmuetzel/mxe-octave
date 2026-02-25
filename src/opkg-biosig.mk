# This file is part of MXE.
# See index.html for further information.

PKG             := opkg-biosig
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.9.3
$(PKG)_CHECKSUM := 88da4ca5e1d1cdcc6fc360d4971ee4420a593384
$(PKG)_SUBDIR   := biosig4octave-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_SUBDIR).src.tar.gz
$(PKG)_URL      := https://sourceforge.net/projects/biosig/files/Biosig%20for%20Octave/$($(PKG)_FILE)
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
