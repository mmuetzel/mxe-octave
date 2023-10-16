# This file is part of MXE.
# See index.html for further information.

PKG             := qt6-qtbase
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 6.6.0
$(PKG)_CHECKSUM := fb8c7f38c5ab71769044b723be1a6956688d55a4
$(PKG)_SUBDIR   := qtbase-everywhere-src-$($(PKG)_VERSION)
$(PKG)_FILE     := qtbase-everywhere-src-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := https://download.qt.io/official_releases/qt/$(call SHORT_PKG_VERSION,$(PKG))/$($(PKG)_VERSION)/submodules/$($(PKG)_FILE)
ifeq ($(USE_SYSTEM_FONTCONFIG),no)
  $(PKG)_FONTCONFIG := fontconfig
endif
$(PKG)_DEPS     := dbus double-conversion freetds freetype $($(PKG)_FONTCONFIG) icu4c jpeg libjbig libpng libproxy pcre2 postgresql sqlite zlib zstd

$(PKG)_CMAKE_OPTS :=
$(PKG)_CONFIGURE_ENV :=
$(PKG)_PKG_CONFIG_PATH := $(PKG_CONFIG_PATH)

ifeq ($(USE_SYSTEM_OPENGL),no)
  $(PKG)_DEPS += mesa
  $(PKG)_CMAKE_OPTS += -DFEATURE_egl=OFF
endif
ifeq ($(MXE_WINDOWS_BUILD),yes)
  $(PKG)_DEPS += uuid
  $(PKG)_CONFIGURE_ENV := PSQL_LIBS="-lpq -lsecur32 -lws2_32"
  $(PKG)_CMAKE_OPTS += \
    -DFEATURE_sql_mysql=OFF \
    -DFEATURE_sql_odbc=ON \
    -DFEATURE_opengl_dynamic=ON \
    -DFEATURE_sql_psql=ON \
    -DFEATURE_sql_sqlite=ON \
    -DFEATURE_system_sqlite=ON
 
  ifeq ($(ENABLE_WINDOWS_64),yes)
    $(PKG)_DEPS += icu4c
    $(PKG)_CMAKE_OPTS += -DFEATURE_icu=ON
  else
    $(PKG)_CMAKE_OPTS += -DFEATURE_icu=OFF
  endif
else
  $(PKG)_DEPS += icu4c
  $(PKG)_CMAKE_OPTS += -DFEATURE_icu=ON
  $(PKG)_CMAKE_OPTS += \
    -DFEATURE_system_sqlite=ON
 
  ifeq ($(USE_SYSTEM_X11_LIBS),no)
    $(PKG)_DEPS += xdamage xdmcp xext xfixes xi xrender xt xxf86vm x11 xcb xcb-util xcb-util-cursor xcb-util-image xcb-util-keysyms xcb-util-renderutil xcb-util-wm xkbcommon
  endif
endif

define $(PKG)_UPDATE
    $(WGET) -q -O- http://download.qt-project.org/official_releases/qt/$(call SHORT_PKG_VERSION,$(PKG))/ | \
    $(SED) -n 's,.*href="\(6\.[0-9]\+\.[^/]*\)/".*,\1,p' | \
    grep -iv -- '-rc' | \
    sort |
    tail -1
endef

ifeq ($(MXE_NATIVE_BUILD),no)
  $(PKG)_CMAKE_OPTS += -DQT_QMAKE_DEVICE_OPTIONS=CROSS_COMPILE=$(MXE_TOOL_PREFIX)
  $(PKG)_CMAKE_OPTS += -DQT_HOST_PATH='$(BUILD_TOOLS_PREFIX)/qt6'
  ifeq ($(MXE_WINDOWS_BUILD),yes)
    $(PKG)_CMAKE_OPTS += -DQT_QMAKE_TARGET_MKSPEC=win32-g++
  endif
endif

$(PKG)_CONFIGURE_ENV += \
    PKG_CONFIG="$(MXE_PKG_CONFIG)" \
    PKG_CONFIG_SYSROOT_DIR="/" \
    PKG_CONFIG_LIBDIR=$($(PKG)_PKG_CONFIG_PATH)

define $(PKG)_BUILD
    if [ "$(MXE_NATIVE_BUILD)" = "no" ]; then \
      mkdir '$(1).native'; \
      cmake -S '$(1)' -B '$(1).native' \
        -DCMAKE_INSTALL_PREFIX='$(BUILD_TOOLS_PREFIX)/qt6' \
        -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_NATIVE_TOOLCHAIN_FILE)' \
        -DQT_BUILD_{TESTS,EXAMPLES,DOCS}=OFF \
        -DBUILD_WITH_PCH=OFF \
        -DFEATURE_pcre2=ON \
        -DFEATURE_{pkg_config,eventfd,glib,gui,icu,openssl,zstd,thread,system_pcre2,sql,xml,testlib,backtrace}=OFF; \
      cmake --build '$(1).native' -j '$(JOBS)'; \
      cmake --install '$(1).native'; \
    fi

    mkdir '$(1).build'
    $($(PKG)_CONFIGURE_ENV) \
    'cmake' -S '$(1)' -B '$(1).build' \
        $(CMAKE_CCACHE_FLAGS) \
        -DCMAKE_INSTALL_PREFIX='$(HOST_PREFIX)/qt6' \
        -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)' \
        -DQT_BUILD_EXAMPLES=OFF \
        -DQT_BUILD_TESTS=OFF \
        -DBUILD_WITH_PCH=OFF \
        -DFEATURE_accessibility=ON \
        -DFEATURE_dbus=OFF \
        -DFEATURE_fontconfig=OFF \
        -DFEATURE_system_freetype=ON \
        -DFEATURE_glib=OFF \
        -DFEATURE_system_harfbuzz=OFF \
        -DFEATURE_openssl=OFF \
        -DFEATURE_system_pcre2=ON \
        -DFEATURE_pkg_config=ON \
        -DFEATURE_system_zlib=ON \
        -DFEATURE_use_gold_linker_alias=OFF \
        $($(PKG)_CMAKE_OPTS)

    'cmake' --build '$(1).build' -j '$(JOBS)'
    'cmake' --install '$(1).build'

    if [ "$(MXE_WINDOWS_BUILD)" = yes ]; then \
      $(INSTALL) -d '$(HOST_BINDIR)'; \
      cp '$(HOST_PREFIX)'/qt6/bin/Qt6Concurrent.dll '$(HOST_BINDIR)'/Qt6Concurrent.dll; \
      cp '$(HOST_PREFIX)'/qt6/bin/Qt6Core.dll '$(HOST_BINDIR)'/Qt6Core.dll; \
      cp '$(HOST_PREFIX)'/qt6/bin/Qt6Gui.dll '$(HOST_BINDIR)'/Qt6Gui.dll; \
      cp '$(HOST_PREFIX)'/qt6/bin/Qt6Network.dll '$(HOST_BINDIR)'/Qt6Network.dll; \
      cp '$(HOST_PREFIX)'/qt6/bin/Qt6OpenGL.dll '$(HOST_BINDIR)'/Qt6OpenGL.dll; \
      cp '$(HOST_PREFIX)'/qt6/bin/Qt6OpenGLWidgets.dll '$(HOST_BINDIR)'/Qt6OpenGLWidgets.dll; \
      cp '$(HOST_PREFIX)'/qt6/bin/Qt6PrintSupport.dll '$(HOST_BINDIR)'/Qt6PrintSupport.dll; \
      cp '$(HOST_PREFIX)'/qt6/bin/Qt6Sql.dll '$(HOST_BINDIR)'/Qt6Sql.dll; \
      cp '$(HOST_PREFIX)'/qt6/bin/Qt5Test.dll '$(HOST_BINDIR)'/Qt6Test.dll; \
      cp '$(HOST_PREFIX)'/qt6/bin/Qt6Widgets.dll '$(HOST_BINDIR)'/Qt6Widgets.dll; \
      cp '$(HOST_PREFIX)'/qt6/bin/Qt6Xml.dll '$(HOST_BINDIR)'/Qt6Xml.dll; \
    fi

    if [ "$(MXE_NATIVE_BUILD)" = "no" ]; then \
      ln -sf '$(BUILD_TOOLS_PREFIX)/qt6/bin/qmake6' '$(BUILD_TOOLS_PREFIX)/bin/$(MXE_TOOL_PREFIX)'qmake-qt6; \
      ln -sf '$(BUILD_TOOLS_PREFIX)/qt6/libexec/moc' '$(BUILD_TOOLS_PREFIX)/bin/$(MXE_TOOL_PREFIX)'moc; \
      ln -sf '$(BUILD_TOOLS_PREFIX)/qt6/libexec/uic' '$(BUILD_TOOLS_PREFIX)/bin/$(MXE_TOOL_PREFIX)'uic; \
      ln -sf '$(BUILD_TOOLS_PREFIX)/qt6/libexec/rcc' '$(BUILD_TOOLS_PREFIX)/bin/$(MXE_TOOL_PREFIX)'rcc; \
    else \
      ln -sf '$(BUILD_TOOLS_PREFIX)/qt6/bin/qt-cmake' '$(HOST_PREFIX)/qt6/bin/qt-cmake-private'; \
    fi
endef
