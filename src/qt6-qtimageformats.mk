# This file is part of MXE.
# See index.html for further information.

PKG             := qt6-qtimageformats
$(PKG)_IGNORE   :=
$(PKG)_VERSION   = $(qt6-qtbase_VERSION)
$(PKG)_CHECKSUM := 8408e616abf43ae34b39ad91ea94fe37fe80f2d2
$(PKG)_SUBDIR    = $(subst qtbase,qtimageformats,$(qt6-qtbase_SUBDIR))
$(PKG)_FILE      = $(subst qtbase,qtimageformats,$(qt6-qtbase_FILE))
$(PKG)_URL       = $(subst qtbase,qtimageformats,$(qt6-qtbase_URL))
$(PKG)_DEPS     := jasper libmng qt6-qtbase tiff

define $(PKG)_UPDATE
    echo $(qt6-qtbase_VERSION)
endef

define $(PKG)_BUILD
  mkdir '$(1).build'
  cd '$(1)' && '$(HOST_PREFIX)/qt6/bin/qt-cmake-private' \
    -S '$(1)' -B '$(1).build' \
    -DCMAKE_INSTALL_PREFIX='$(HOST_PREFIX)/qt6'
  cmake --build $(1).build -j '$(JOBS)'
  cmake --install $(1).build
endef
