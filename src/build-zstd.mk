# This file is part of MXE.
# See index.html for further information.

PKG             := build-zstd
$(PKG)_IGNORE   := 
$(PKG)_VERSION  := 1.5.0
$(PKG)_CHECKSUM := c53019729e3a595f0104facab6533d78296a2945
$(PKG)_SUBDIR   := zstd-$($(PKG)_VERSION)
$(PKG)_FILE     := zstd-$($(PKG)_VERSION).tar.lz
$(PKG)_URL      := https://github.com/facebook/zstd/releases/download/v$($(PKG)_VERSION)/zstd-$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     := build-cmake

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://github.com/facebook/zstd/tags' | \
    $(SED) -n 's|.*releases/tag/v\([^"]*\).*|\1|p' | $(SORT) -V | \
    tail -1
endef

$(PKG)_CMAKE_FLAGS := -DZSTD_BUILD_TESTS=ON -DZSTD_BUILD_SHARED=OFF \
	-DZSTD_BUILD_STATIC=ON -DZSTD_PROGRAMS_LINK_SHARED=OFF -DZSTD_MULTITHREAD_SUPPORT=OFF

define $(PKG)_BUILD
  mkdir '$(1)/.build' && cd '$(1)/.build' && cmake $(1)/build/cmake/ \
    $($(PKG)_CMAKE_FLAGS) \
    $(CMAKE_CCACHE_FLAGS) \
    -DCMAKE_INSTALL_PREFIX='$(3)$(BUILD_TOOLS_PREFIX)' \
    -DBUILD_TESTING=Off

  cmake --build '$(1)/.build' -j '$(JOBS)'
  cmake --install '$(1)/.build'
endef
