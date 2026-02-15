# This file is part of MXE.
# See index.html for further information.

PKG             := openjpeg
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.5.4
$(PKG)_CHECKSUM := c299b70e495e74d858f6d22051de1d5a01a64d33
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_SUBDIR).tar.gz
$(PKG)_URL      := https://github.com/uclouvain/$(PKG)/archive/v$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     := lcms libpng tiff zlib

$(PKG)_CMAKE_FLAGS :=

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,uclouvain,openjpeg,v)
endef

define $(PKG)_BUILD
    cd '$(1)' && cmake \
        $($(PKG)_CMAKE_FLAGS) \
        -DBUILD_TESTING=OFF \
        $(CMAKE_CCACHE_FLAGS) \
        $(CMAKE_BUILD_SHARED_OR_STATIC) \
        -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)' \
        .

    $(MAKE) -C '$(1)' -j '$(JOBS)' VERBOSE=1
    $(MAKE) -C '$(1)' -j '1' VERBOSE=1 DESTDIR='$(3)' install


endef
