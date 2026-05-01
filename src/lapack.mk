# This file is part of MXE.
# See index.html for further information.

PKG             := lapack
$(PKG)_VERSION  := 3.12.1
$(PKG)_CHECKSUM := f9d49090a80aa864f0af1b9aae27b6c726ef153b
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/Reference-LAPACK/$(PKG)/archive/refs/tags/v$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     :=

ifeq ($(ENABLE_FORTRAN_INT64),yes)
  $(PKG)_DEFAULT_INTEGER_8_FLAG := -fdefault-integer-8
endif

define $(PKG)_UPDATE
  $(call GITHUB_PKG_UPDATE,Reference-LAPACK,lapack,v)
endef

define $(PKG)_BUILD
  mkdir '$(1)/build'
  cd '$(1)/build' && cmake \
    $(CMAKE_CCACHE_FLAGS) \
    $(CMAKE_BUILD_SHARED_OR_STATIC) \
    -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)' \
    -DCMAKE_AR='$(shell which $(MXE_AR))' \
    -DCMAKE_RANLIB='$(shell which $(MXE_RANLIB))' \
    -DCMAKE_Fortran_FLAGS='$($(PKG)_DEFAULT_INTEGER_8_FLAG)' \
    -DBUILD_DEPRECATED=ON \
    -DBUILD_INDEX64_EXT_API=OFF \
    -DBUILD_TESTING=OFF \
    -DCBLAS=ON \
    -DLAPACKE=ON \
    $($(PKG)_BLAS_CONFIG_OPTS) \
    $(1)

  cmake --build '$(1)/build'
  DESTDIR='$(3)' cmake --install '$(1)/build'
  
  # FIXME: Make the pkg-config files relocatable.
endef

