# This file is part of MXE.
# See index.html for further information.

PKG             := qt6-qtsvg
$(PKG)_IGNORE   :=
$(PKG)_VERSION   = $(qt6-qtbase_VERSION)
$(PKG)_CHECKSUM := 6241d1d27dba327c79ce70144d38b4856c2aef2d
$(PKG)_SUBDIR    = $(subst qtbase,qtsvg,$(qt6-qtbase_SUBDIR))
$(PKG)_FILE      = $(subst qtbase,qtsvg,$(qt6-qtbase_FILE))
$(PKG)_URL       = $(subst qtbase,qtsvg,$(qt6-qtbase_URL))
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
      cp '$(HOST_PREFIX)'/qt6/bin/Qt6Svg.dll '$(HOST_BINDIR)'/Qt6Svg.dll; \
      cp '$(HOST_PREFIX)'/qt6/bin/Qt6SvgWidgets.dll '$(HOST_BINDIR)'/Qt6SvgWidgets.dll; \
    fi
endef
