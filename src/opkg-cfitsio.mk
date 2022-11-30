# This file is part of MXE.
# See index.html for further information.

PKG             := opkg-cfitsio
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.0.4
$(PKG)_CHECKSUM := 8676194cddbad7d39c0e3356df98a8d670b19979
$(PKG)_SUBDIR   := octave-cfitsio-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_SUBDIR).tar.gz
$(PKG)_URL      := https://downloads.sourceforge.net/project/octave-cfitsio/v$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_DEPS     := cfitsio

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
  $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

define $(PKG)_UPDATE
    $(WGET) -q -O- https://sourceforge.net/p/octave-cfitsio/code/ci/default/tree/ | \
    $(SED) -n 's|.*code/ci/v\([0-9][0-9.]*\)/tree.*|\1|p' | $(SORT) -V | \
    tail -1
endef

define $(PKG)_BUILD
  $(OCTAVE_FORGE_PKG_BUILD)
endef
