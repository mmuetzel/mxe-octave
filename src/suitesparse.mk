# This file is part of MXE.
# See index.html for further information.

PKG             := suitesparse
$(PKG)_VERSION  := 7.4.0
$(PKG)_CHECKSUM := c2709fc33b843d4830e6cedc4d4821d49ac99bc0
$(PKG)_SUBDIR   := SuiteSparse-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_SUBDIR).tar.gz
$(PKG)_URL      := https://github.com/DrTimothyAldenDavis/SuiteSparse/archive/v$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     := blas lapack mpfr
ifeq ($(USE_SYSTEM_GCC),no)
  $(PKG)_DEPS += libgomp
endif

ifeq ($(MXE_NATIVE_MINGW_BUILD),yes)
  $(PKG)_DESTDIR :=
else
  $(PKG)_DESTDIR := $(3)
endif

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,DrTimothyAldenDavis,SuiteSparse,v)
endef


ifeq ($(ENABLE_FORTRAN_INT64),yes)
  $(PKG)_CMAKE_FLAGS += -DSUITESPARSE_USE_64BIT_BLAS=ON
endif

$(PKG)_MAKE_OPTS = \
    FFLAGS='$(MXE_FFLAGS)' \
    CFLAGS='$(MXE_CFLAGS)' \
    CXXFLAGS='$(MXE_CXXFLAGS)' \
    AR='$(MXE_AR)' \
    RANLIB='$(MXE_RANLIB)'

define $(PKG)_BUILD
    cd '$(1)/build' && $($(PKG)_MAKE_OPTS) cmake \
        $($(PKG)_CMAKE_FLAGS) \
        $(CMAKE_CCACHE_FLAGS) \
        -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)' \
        -DSUITESPARSE_CROSS_TOOLCHAIN_FLAGS_NATIVE="-DCMAKE_TOOLCHAIN_FILE=$(CMAKE_NATIVE_TOOLCHAIN_FILE)" \
        -DGRAPHBLAS_COMPACT=ON \
        -DSUITESPARSE_USE_OPENMP=OFF \
        -DBLA_VENDOR="Generic" -DBLAS_LIBRARIES="-lblas -lgfortran" -DLAPACK_LIBRARIES="-llapack" \
        -DSUITESPARSE_USE_CUDA=OFF \
        $(CMAKE_CCACHE_FLAGS) $(CMAKE_BUILD_SHARED_OR_STATIC) \
        $(1)

    cmake --build '$(1)/build'
    DESTDIR='$(3)' cmake --install '$(1)/build'
endef

