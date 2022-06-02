# This file is part of MXE.
# See index.html for further information.

PKG             := gta
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.2.1
$(PKG)_CHECKSUM := efaf3e315c6df53ece1ae1dbb23d19f703c6b62e
$(PKG)_SUBDIR   := gta-mirror-libgta-$($(PKG)_VERSION)/libgta
$(PKG)_FILE     := libgta-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/marlam/gta-mirror/archive/libgta-$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     := zlib bzip2 xz

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://github.com/marlam/gta-mirror/tags' | \
    $(SED) -n 's|.*releases/tag/libgta-\([^"]*\).*|\1|p' | $(SORT) -V | \
    tail -1
endef

define $(PKG)_BUILD
    cd '$(1)' && cmake \
        $($(PKG)_CMAKE_FLAGS) \
        -DGTA_BUILD_DOCUMENTATION=OFF \
        $(CMAKE_CCACHE_FLAGS) \
        $(CMAKE_BUILD_SHARED_OR_STATIC) \
        -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)' \
        .

    $(MAKE) -C '$(1)' -j '$(JOBS)' VERBOSE=1
    $(MAKE) -C '$(1)' -j '1' VERBOSE=1 DESTDIR='$(3)' install
endef
