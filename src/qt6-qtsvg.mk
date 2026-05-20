# This file is part of MXE.
# See index.html for further information.

PKG             := qt6-qtsvg
$(PKG)_IGNORE   :=
$(PKG)_VERSION   = $(qt6-qtbase_VERSION)
$(PKG)_CHECKSUM := f14beff9a6392bc14b997a1b1c9849070360989a
$(PKG)_SUBDIR    = $(subst qtbase,qtsvg,$(qt6-qtbase_SUBDIR))
$(PKG)_FILE      = $(subst qtbase,qtsvg,$(qt6-qtbase_FILE))
$(PKG)_URL       = $(subst qtbase,qtsvg,$(qt6-qtbase_URL))
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
      cp '$(HOST_PREFIX)'/qt6/bin/Qt6Svg.dll '$(HOST_BINDIR)'/Qt6Svg.dll; \
      cp '$(HOST_PREFIX)'/qt6/bin/Qt6SvgWidgets.dll '$(HOST_BINDIR)'/Qt6SvgWidgets.dll; \
    fi
endef
