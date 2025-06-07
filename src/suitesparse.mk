# This file is part of MXE.
# See index.html for further information.

PKG             := suitesparse
$(PKG)_VERSION  := 7.10.3
$(PKG)_CHECKSUM := 04d978ceb1b59596e822aa7a2006288704c5986d
$(PKG)_SUBDIR   := SuiteSparse-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_SUBDIR).tar.gz
$(PKG)_URL      := https://github.com/DrTimothyAldenDavis/SuiteSparse/archive/v$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     := lapack mpfr
ifeq ($(USE_SYSTEM_GCC),no)
  $(PKG)_DEPS += libgomp
endif

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,DrTimothyAldenDavis,SuiteSparse,v)
endef

ifeq ($(ENABLE_FORTRAN_INT64),yes)
  $(PKG)_CMAKE_FLAGS += -DSUITESPARSE_USE_64BIT_BLAS=ON
endif

define $(PKG)_BUILD
    cd '$(1)/build' && cmake \
        $($(PKG)_CMAKE_FLAGS) \
        $(CMAKE_CCACHE_FLAGS) \
        -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)' \
        -DGRAPHBLAS_CROSS_TOOLCHAIN_FLAGS_NATIVE="-DCMAKE_TOOLCHAIN_FILE=$(CMAKE_NATIVE_TOOLCHAIN_FILE)" \
        -DGRAPHBLAS_COMPACT=ON \
        -DSUITESPARSE_USE_OPENMP=OFF \
        -DBLA_VENDOR="Generic" -DBLAS_LIBRARIES="-lblas -lgfortran" -DLAPACK_LIBRARIES="-llapack" \
        -DSUITESPARSE_USE_CUDA=OFF \
        -DSUITESPARSE_DEMOS=OFF \
        -DBUILD_TESTING=OFF \
        $(CMAKE_CCACHE_FLAGS) $(CMAKE_BUILD_SHARED_OR_STATIC) \
        $(1)

    cmake --build '$(1)/build' -j $(JOBS)
    DESTDIR='$(3)' cmake --install '$(1)/build'
endef

