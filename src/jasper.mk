# This file is part of MXE.
# See index.html for further information.

PKG             := jasper
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.1.1
$(PKG)_CHECKSUM := 25f0d383c5360f7b7421a43f022e13aa0141c956
$(PKG)_SUBDIR   := jasper-version-$($(PKG)_VERSION)
$(PKG)_FILE     := jasper-version-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/jasper-software/$(PKG)/archive/version-$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     := jpeg


ifeq ($(MXE_NATIVE_BUILD),no)
$(PKG)_CMAKE_FLAGS = -DJAS_STDC_VERSION="`'$(MXE_CC)' -dM -E - < /dev/null | grep __STDC_VERSION__ | '$(SED)' 's/^\([^ ]\+ \)\{2\}//;'`"
else
$(PKG)_CMAKE_FLAGS :=
endif

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,jasper-software,jasper,version-)
endef

define $(PKG)_BUILD
    mkdir $(1).build && cd '$(1).build' && cmake \
        $($(PKG)_CMAKE_FLAGS) \
        -DJAS_ENABLE_AUTOMATIC_DEPENDENCIES=OFF \
        -DJAS_ENABLE_LIBJPEG=ON \
        -DJAS_ENABLE_OPENGL=OFF \
        -DJAS_ENABLE_PROGRAMS=OFF \
        -DJAS_ENABLE_DOC=OFF \
        -DJAS_ENABLE_SHARED=$(if $(findstring yes,$(BUILD_SHARED)),ON,OFF) \
        -DBUILD_TESTING=NO \
        $(CMAKE_CCACHE_FLAGS) \
        -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)' \
        $(1)

    $(MAKE) -C '$(1).build' -j '$(JOBS)' VERBOSE=1
    $(MAKE) -C '$(1).build' -j '1' VERBOSE=1 DESTDIR='$(3)' install
endef
