# This file is part of MXE Octave.
# See index.html for further information.

PKG             := mesa
$(PKG)_VERSION  := 26.1.3
$(PKG)_CHECKSUM := 63c97fabe0f5692bdeb917652a05393d612bd717
$(PKG)_SUBDIR   := mesa-$($(PKG)_VERSION)
$(PKG)_FILE     := mesa-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := https://archive.mesa3d.org/$($(PKG)_FILE)
$(PKG)_DEPS     := build-mako build-meson build-ninja build-pyyaml expat zlib llvm s2tc

define $(PKG)_UPDATE
    $(WGET) -q -O- https://archive.mesa3d.org | \
    $(SED) -n 's|.*href=\"mesa-\([0-9][0-9\.]*\)\.tar.xz\".*|\1|p' | $(SORT) -V | \
    tail -1
endef

# FIXME: Should this be defined in the top-level Makefile?
ifeq ($(MXE_NATIVE_BUILD),no)
  MESON_TOOLCHAIN_FILE := $(HOST_PREFIX)/share/meson/cross/mxe-conf.ini
  $(PKG)_MESON_TOOLCHAIN_FILE := --cross-file '$(MESON_TOOLCHAIN_FILE)'
else
  MESON_TOOLCHAIN_FILE := $(HOST_PREFIX)/share/meson/native/mxe-conf.ini
  $(PKG)_MESON_TOOLCHAIN_FILE := --native-file '$(MESON_TOOLCHAIN_FILE)'
endif

ifeq ($(MXE_WINDOWS_BUILD),yes)
  $(PKG)_LLVM_FLAGS := -Dshared-llvm=disabled
else
  ifeq ($(USE_SYSTEM_X11_LIBS),no)
    $(PKG)_DEPS += dri2proto glproto libdrm libxshmfence x11 xdamage xext xfixes xrandr
    $(PKG)_BUILD_X11_LIBS_FLAGS = -Dxlib-lease=disabled
  else
    $(PKG)_PKG_CONFIG_PATH := $(PKG_CONFIG_PATH):$(BUILD_PKG_CONFIG_PATH)
  endif
  $(PKG)_MESON_ENV += \
      PKG_CONFIG="$(MXE_PKG_CONFIG)" \
      PKG_CONFIG_LIBDIR=$($(PKG)_PKG_CONFIG_PATH)

  $(PKG)_X11_FLAGS := -Dplatforms='x11' \
      -Dglx=xlib \
      $($(PKG)_BUILD_X11_LIBS_FLAGS)

  $(PKG)_LLVM_FLAGS := -Dshared-llvm=enabled
endif

define $(PKG)_BUILD
  $($(PKG)_MESON_ENV) \
    meson setup $(1)/.build $(1) \
      $($(PKG)_MESON_TOOLCHAIN_FILE) \
      --prefix='$(HOST_PREFIX)' \
      $($(PKG)_X11_FLAGS) \
      -Dgallium-drivers='softpipe,llvmpipe' \
      -Dvulkan-drivers='' \
      -Degl=disabled \
      -Dgbm=disabled \
      $($(PKG)_LLVM_FLAGS)

  # For some reason, meson attempts to link with -lpthread also if the thread
  # model is MCF. To work around that, remove all references to -pthread from
  # the generated build.ninja file.
  if [ x$(MXE_SYSTEM)$(HOST_THREADS) == xmingwmcf ]; then \
    cd '$(1)/.build' && sed -i "s/-pthread//g" build.ninja; \
  fi

  meson compile -C '$(1)/.build' -j $(JOBS)
  meson install -C '$(1)/.build' --destdir '$(3)'

  #  install headers
  for i in EGL GLES GLES2 GLES3 KHR; do \
    $(INSTALL) -d "$(HOST_INCDIR)/$$i"; \
    $(INSTALL) -m 644 "$(1)/include/$$i/"* "$(HOST_INCDIR)/$$i/"; \
  done
  
  # opengl32.dll.a shadows libopengl32.a from mingw-w64. They export slightly
  # different symbols which causes problems for some packages. So don't install
  # it for MinGW.
  if [ x$(MXE_SYSTEM) == xmingw ]; then \
    rm -f $(3)$(HOST_LIBDIR)/opengl32.dll.a; \
  fi

  # provide s/w backup opengl
  if [ x$(MXE_WINDOWS_BUILD) == xyes ]; then \
    $(INSTALL) "$(3)/$(HOST_BINDIR)/opengl32.dll" "$(3)/$(HOST_BINDIR)/opengl32sw.dll"; \
  fi

endef
