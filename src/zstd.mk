# This file is part of MXE.
# See index.html for further information.

PKG             := zstd
$(PKG)_IGNORE   := 
$(PKG)_VERSION  := 1.5.5
$(PKG)_CHECKSUM := 4479ecc74300d23391d99fbebf2fddd47aed9b28
$(PKG)_SUBDIR   := zstd-$($(PKG)_VERSION)
$(PKG)_FILE     := zstd-$($(PKG)_VERSION).tar.lz
$(PKG)_URL      := https://github.com/facebook/zstd/releases/download/v$($(PKG)_VERSION)/zstd-$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     := build-cmake

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://github.com/facebook/zstd/tags' | \
    $(SED) -n 's|.*releases/tag/v\([^"]*\).*|\1|p' | $(SORT) -V | \
    tail -1
endef

ifeq ($(BUILD_SHARED),yes)
$(PKG)_CMAKE_FLAGS := -DZSTD_BUILD_SHARED=ON -DZSTD_BUILD_STATIC=OFF
else
$(PKG)_CMAKE_FLAGS := -DZSTD_BUILD_SHARED=OFF -DZSTD_BUILD_STATIC=ON
endif

define $(PKG)_BUILD
  mkdir '$(1)/.build' && cd '$(1)/.build' && cmake $(1)/build/cmake/ \
    $(CMAKE_CCACHE_FLAGS) \
    $($(PKG)_CMAKE_FLAGS) \
    -DZSTD_BUILD_PROGRAMS=OFF \
    -DZSTD_BUILD_TESTS=OFF \
    -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)'

  cmake --build '$(1)/.build' -j '$(JOBS)'
  cmake --install '$(1)/.build'
endef
