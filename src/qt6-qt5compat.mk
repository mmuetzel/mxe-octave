# This file is part of MXE.
# See index.html for further information.

PKG             := qt6-qt5compat
$(PKG)_IGNORE   :=
$(PKG)_VERSION   = $(qt6-qtbase_VERSION)
$(PKG)_CHECKSUM := e9276d7a20d01475483995029ecab29a7e7657d4
$(PKG)_SUBDIR    = $(subst qtbase,qt5compat,$(qt6-qtbase_SUBDIR))
$(PKG)_FILE      = $(subst qtbase,qt5compat,$(qt6-qtbase_FILE))
$(PKG)_URL       = $(subst qtbase,qt5compat,$(qt6-qtbase_URL))
$(PKG)_DEPS     := qt6-qtbase

define $(PKG)_UPDATE
    echo $(qt6-qtbase_VERSION)
endef

define $(PKG)_BUILD
    '$(HOST_PREFIX)/qt6/bin/qt-cmake-private' \
      -S '$(1)' -B '$(1).build' \
      -DCMAKE_INSTALL_PREFIX='$(HOST_PREFIX)/qt6'
    cmake --build '$(1).build' -j '$(JOBS)'
    cmake --install '$(1).build'
    if [ $(MXE_WINDOWS_BUILD) = yes ]; then \
      $(INSTALL) -d '$(HOST_BINDIR)'; \
      cp '$(HOST_PREFIX)'/qt6/bin/Qt6Core5Compat.dll '$(HOST_BINDIR)'/Qt6Core5Compat.dll; \
    fi
endef
