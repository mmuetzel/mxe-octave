# This file is part of MXE.
# See index.html for further information.

PKG             := qt6-qt5compat
$(PKG)_IGNORE   :=
$(PKG)_VERSION   = $(qt6-qtbase_VERSION)
$(PKG)_CHECKSUM := 7b7f0614b4ae3736a8c1b19f7be3353493170c36
$(PKG)_SUBDIR    = $(subst qtbase,qt5compat,$(qt6-qtbase_SUBDIR))
$(PKG)_FILE      = $(subst qtbase,qt5compat,$(qt6-qtbase_FILE))
$(PKG)_URL       = $(subst qtbase,qt5compat,$(qt6-qtbase_URL))
$(PKG)_DEPS     := qt6-qtbase

define $(PKG)_UPDATE
    echo $(qt6-qtbase_VERSION)
endef

define $(PKG)_BUILD
    cd '$(1)' && '$(HOST_PREFIX)/qt6/bin/qt-cmake-private' -DCMAKE_INSTALL_PREFIX='$(HOST_PREFIX)/qt6'
    cmake --build $(1) -j '$(JOBS)'
    cmake --install $(1)
    if [ $(MXE_WINDOWS_BUILD) = yes ]; then \
      $(INSTALL) -d '$(HOST_BINDIR)'; \
      cp '$(HOST_PREFIX)'/qt6/bin/Qt6Core5Compat.dll '$(HOST_BINDIR)'/Qt6Core5Compat.dll; \
    fi
endef
