# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := qt6-qttranslations
$(PKG)_IGNORE   :=
$(PKG)_VERSION   = $(qt6-qtbase_VERSION)
$(PKG)_CHECKSUM := 9014fd62513596e99b7387daa50a52ecd3266752
$(PKG)_SUBDIR    = $(subst qtbase,qttranslations,$(qt6-qtbase_SUBDIR))
$(PKG)_FILE      = $(subst qtbase,qttranslations,$(qt6-qtbase_FILE))
$(PKG)_URL       = $(subst qtbase,qttranslations,$(qt6-qtbase_URL))
$(PKG)_DEPS     := qt6-qtbase qt6-qttools

define $(PKG)_UPDATE
    echo $(qt6-qtbase_VERSION)
endef

define $(PKG)_BUILD
    '$(HOST_PREFIX)/qt6/bin/qt-cmake-private' \
      -S '$(1)' -B '$(1).build' \
      -DCMAKE_INSTALL_PREFIX='$(HOST_PREFIX)/qt6' \
      -DQT_HOST_PATH='$(BUILD_TOOLS_PREFIX)/qt6'
    cmake --build '$(1).build' -j '$(JOBS)'
    cmake --install '$(1).build'
endef

