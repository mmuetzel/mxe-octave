# This file is part of MXE.
# See index.html for further information.

PKG             := build-scons
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.1.0.post1
$(PKG)_CHECKSUM := 47bb89c546804fd76724fd206817ae9a19d4f2bd
$(PKG)_SUBDIR   := SCons-$($(PKG)_VERSION)
$(PKG)_FILE     := scons-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://sourceforge.net/projects/scons/files/scons/$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_DEPS     := build-python3

define $(PKG)_UPDATE
    $(WGET) -q -O- https://sourceforge.net/projects/scons/files/scons/ | \
    $(SED) -n 's|.*<tr title=\"\([0-9][^"]*\)".*|\1|p' | \
    head -1
endef

define $(PKG)_BUILD
    cd '$(1)' && $(PYTHON3) setup.py install --prefix='$(BUILD_TOOLS_PREFIX)'
endef
