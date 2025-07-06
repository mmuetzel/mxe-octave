# This file is part of MXE.
# See index.html for further information.

PKG             := of-octproj
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.1.0
$(PKG)_CHECKSUM := d0698ace380293b59023a3ce9c90e4b1a4483b17
$(PKG)_SUBDIR   := octproj-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_SUBDIR).tar.gz
$(PKG)_URL      := https://bitbucket.org/jgpallero/octproj/downloads/$($(PKG)_FILE)
$(PKG)_DEPS     := proj

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
    $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://bitbucket.org/jgpallero/octproj/downloads/?tab=tags' | \
    $(SED) -n 's|.*>OctPROJ-\([^<]*\).*|\1|p' | $(SORT) -V | \
    tail -1
endef

define $(PKG)_BUILD
    $(OCTAVE_FORGE_PKG_BUILD)
endef
