# This file is part of MXE.
# See index.html for further information.

PKG             := freeglut
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.4.0
$(PKG)_CHECKSUM := 169b069a6c3e7a3ce960887ab3e4a8ee73443bbd
$(PKG)_SUBDIR   := freeglut-$(word 1,$(subst -, ,$($(PKG)_VERSION)))
$(PKG)_FILE     := freeglut-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := http://$(SOURCEFORGE_MIRROR)/project/freeglut/freeglut/$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_DEPS     := mesa
ifeq ($(USE_SYSTEM_X11_LIBS),no)
  $(PKG)_DEPS += xi
endif

$(PKG)_CMAKE_FLAGS :=

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://github.com/FreeGLUTProject/freeglut/tags' | \
    $(SED) -n 's|.*releases/tag/v\([^"]*\).*|\1|p' | \
    head -1
endef

define $(PKG)_BUILD
    mkdir '$(1)/build'
    cd '$(1)/build' && cmake \
        $($(PKG)_CMAKE_FLAGS) \
        $(CMAKE_CCACHE_FLAGS) \
        -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)' \
	-DFREEGLUT_REPLACE_GLUT=ON \
	-DFREEGLUT_BUILD_DEMOS=OFF \
	$(if $(filter $(BUILD_STATIC),no),-DFREEGLUT_BUILD_STATIC_LIBS=OFF) \
        $(1)

    cmake --build  '$(1)/build'
    DESTDIR='$(3)' cmake --install '$(1)/build'
endef
