# This file is part of MXE.
# See index.html for further information.

PKG             := proj
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 9.5.1
$(PKG)_CHECKSUM := c5c947b9760a5c3d1966a276b03d13d402432c06
$(PKG)_SUBDIR   := proj-$($(PKG)_VERSION)
$(PKG)_FILE     := proj-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := http://download.osgeo.org/proj/$($(PKG)_FILE)
$(PKG)_URL_2    := ftp://ftp.remotesensing.org/proj/$($(PKG)_FILE)
$(PKG)_DEPS     := curl sqlite tiff

$(PKG)_CMAKE_FLAGS :=

define $(PKG)_UPDATE
    $(WGET) -q -O- 'http://proj.org/download.html' | \
    $(SED) -n 's,.*proj-\([0-9][^>]*\)\.tar.*,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
    cd '$(1)' && cmake \
        $($(PKG)_CMAKE_FLAGS) \
        -DBUILD_TESTING=no \
        $(CMAKE_CCACHE_FLAGS) \
        $(CMAKE_BUILD_SHARED_OR_STATIC) \
        -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)' \
        .

    $(MAKE) -C '$(1)' -j '$(JOBS)' VERBOSE=1
    $(MAKE) -C '$(1)' -j '1' VERBOSE=1 DESTDIR='$(3)' install
endef
