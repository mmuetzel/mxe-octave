# This file is part of MXE.
# See index.html for further information.

PKG             := exiv2
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.27.5
$(PKG)_CHECKSUM := 775f9c5ddeb92b682da8b7737f9811009595dc6a
$(PKG)_SUBDIR   := exiv2-$($(PKG)_VERSION)-Source
$(PKG)_FILE     := exiv2-$($(PKG)_VERSION)-Source.tar.gz
$(PKG)_URL      := https://github.com/Exiv2/exiv2/releases/download/v$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_DEPS     := gettext libiconv zlib expat

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://www.exiv2.org/download.html' | \
    $(SED) -n 's,.*exiv2-\([0-9][^>]*\)-Source\.tar.*,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
    cd '$(1)' && cmake \
        $($(PKG)_CMAKE_FLAGS) \
        -DBUILD_TESTING=no \
        -DEXIV2_BUILD_SAMPLES=OFF \
        $(CMAKE_CCACHE_FLAGS) \
        $(CMAKE_BUILD_SHARED_OR_STATIC) \
        -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)' \
        .

    $(MAKE) -C '$(1)' -j '$(JOBS)' VERBOSE=1
    $(MAKE) -C '$(1)' -j '1' VERBOSE=1 DESTDIR='$(3)' install
endef
