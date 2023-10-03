# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := qt6-qttranslations
$(PKG)_IGNORE   :=
$(PKG)_VERSION   = $(qt6-qtbase_VERSION)
$(PKG)_CHECKSUM := 1ecc96a37d4ec9eb05f89ddfb7323df6b1c2801c
$(PKG)_SUBDIR    = $(subst qtbase,qttranslations,$(qt6-qtbase_SUBDIR))
$(PKG)_FILE      = $(subst qtbase,qttranslations,$(qt6-qtbase_FILE))
$(PKG)_URL       = $(subst qtbase,qttranslations,$(qt6-qtbase_URL))
$(PKG)_DEPS     := qt6-qtbase qt6-qttools

define $(PKG)_UPDATE
    echo $(qt6-qtbase_VERSION)
endef

define $(PKG)_BUILD
    cd '$(1)' && '$(HOST_PREFIX)/qt6/bin/qt-cmake-private' -DCMAKE_INSTALL_PREFIX='$(HOST_PREFIX)/qt6' -DQT_HOST_PATH='$(BUILD_TOOLS_PREFIX)/qt6'
    cmake --build $(1) -j '$(JOBS)'
    cmake --install $(1)
endef

