# This file is part of MXE.
# See index.html for further information.

PKG             := build-ninja
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.11.1
$(PKG)_CHECKSUM := 938723cdfc7a6f7c8f84c83b9a2cecdf1e5e1ad3
$(PKG)_SUBDIR   := ninja-$($(PKG)_VERSION)
$(PKG)_FILE     := ninja-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/ninja-build/ninja/archive/refs/tags/v$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     :=

define $(PKG)_UPDATE
    echo 'Warning: Updates are temporarily disabled for package $(PKG).' >&2;
    echo $($(PKG)_VERSION)
endef

define $(PKG)_BUILD
  mkdir '$(1)/.build' && cd '$(1)/.build' && cmake .. \
    $($(PKG)_CMAKE_FLAGS) \
    $(CMAKE_CCACHE_FLAGS) \
    -DCMAKE_INSTALL_PREFIX='$(3)$(BUILD_TOOLS_PREFIX)' \
    -DBUILD_TESTING=Off

  cmake --build '$(1)/.build' -j '$(JOBS)'
  cmake --install '$(1)/.build'
endef
