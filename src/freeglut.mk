# This file is part of MXE.
# See index.html for further information.

PKG             := freeglut
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.2.1
$(PKG)_CHECKSUM := 7a62e0d2caad92ff745bc5037592b2753f0b2f20
$(PKG)_SUBDIR   := freeglut-$(word 1,$(subst -, ,$($(PKG)_VERSION)))
$(PKG)_FILE     := freeglut-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := http://$(SOURCEFORGE_MIRROR)/project/freeglut/freeglut/$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_DEPS     := mesa xi
ifeq ($(USE_SYSTEM_X11_LIBS),no)
  $(PKG)_DEPS += xi
endif

$(PKG)_CMAKE_FLAGS :=

define $(PKG)_UPDATE
    $(WGET) -q -O- 'http://sourceforge.net/projects/freeglut/files/freeglut/' | \
    $(SED) -n 's,.*freeglut-\([0-9][^>]*\)\.tar.*,\1,p' | \
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
