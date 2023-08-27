# This file is part of MXE.
# See index.html for further information.

PKG             := qt6-qttools
$(PKG)_IGNORE   :=
$(PKG)_VERSION   = $(qt6-qtbase_VERSION)
$(PKG)_CHECKSUM := 2e25b0d40c1bea00b9a1f5dcecf83472d9353190
$(PKG)_SUBDIR    = $(subst qtbase,qttools,$(qt6-qtbase_SUBDIR))
$(PKG)_FILE      = $(subst qtbase,qttools,$(qt6-qtbase_FILE))
$(PKG)_URL       = $(subst qtbase,qttools,$(qt6-qtbase_URL))
$(PKG)_DEPS     := qt6-qtbase

define $(PKG)_UPDATE
    echo $(qt6-qtbase_VERSION)
endef

define $(PKG)_BUILD
    # native tools
    mkdir '$(1).native' && cd '$(1).native' && \
       '$(BUILD_TOOLS_PREFIX)/qt6/bin/qt-cmake' -S '$(1)' -DCMAKE_INSTALL_PREFIX='$(BUILD_TOOLS_PREFIX)/qt6' \
       -DFEATURE_clang=OFF \
       -DFEATURE_clangcpp=OFF \
       -DFEATURE_linguist=ON \
       -DFEATURE_designer=OFF

    cmake --build $(1).native -j '$(JOBS)'
    cmake --install '$(1).native'

    if [ "$(MXE_NATIVE_BUILD)" = "no" ]; then \
        ln -sf '$(BUILD_TOOLS_PREFIX)/qt6/bin/lconvert' '$(BUILD_TOOLS_PREFIX)/bin/$(MXE_TOOL_PREFIX)'lconvert; \
        ln -sf '$(BUILD_TOOLS_PREFIX)/qt6/bin/lrelease' '$(BUILD_TOOLS_PREFIX)/bin/$(MXE_TOOL_PREFIX)'lrelease; \
	echo -e "#!/bin/sh\necho $$0 $$*" > '$(BUILD_TOOLS_PREFIX)/bin/$(MXE_TOOL_PREFIX)'qhelpgenerator && chmod a+rx '$(BUILD_TOOLS_PREFIX)/bin/$(MXE_TOOL_PREFIX)'qhelpgenerator; \
	echo -e "#!/bin/sh\necho $$0 $$*" > '$(BUILD_TOOLS_PREFIX)/bin/$(MXE_TOOL_PREFIX)'qcollectiongenerator && chmod a+rx '$(BUILD_TOOLS_PREFIX)/bin/$(MXE_TOOL_PREFIX)'qcollectiongenerator; \
    fi

    mkdir '$(1).build' && cd '$(1).build' && \
       '$(HOST_PREFIX)/qt6/bin/qt-cmake-private' -DQT_BUILD_TOOLS_WHEN_CROSSCOMPILING=ON -S '$(1)' -DCMAKE_INSTALL_PREFIX='$(HOST_PREFIX)/qt6' 

    # not built for some reason. make dummy so install won't fail
    touch '$(1).build/bin/qhelpgenerator.exe'

    cmake --build $(1).build -j '$(JOBS)'
    cmake --install '$(1).build'

    if [ $(MXE_WINDOWS_BUILD) = yes ]; then \
      $(INSTALL) -d '$(HOST_BINDIR)'; \
      cp '$(HOST_PREFIX)'/qt6/bin/Qt6UiTools.dll '$(HOST_BINDIR)'/Qt6UiTools.dll; \
      cp '$(HOST_PREFIX)'/qt6/bin/Qt6Help.dll '$(HOST_BINDIR)'/Qt6Help.dll; \
      cp '$(HOST_PREFIX)'/qt6/bin/Qt6Designer.dll '$(HOST_BINDIR)'/Qt6Designer.dll; \
      cp '$(HOST_PREFIX)'/qt6/bin/Qt6DesignerComponents.dll '$(HOST_BINDIR)'/Qt6DesignerComponents.dll; \
    fi
endef

