# This file is part of MXE.
# See index.html for further information.

PKG             := suitesparse
$(PKG)_VERSION  := 7.2.0
$(PKG)_CHECKSUM := cb79ed80422b1808b4a5aba27f5878ef84c82f56
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
  $(PKG)_CMAKE_FLAGS += -DALLOW_64BIT_BLAS=ON
endif

ifneq ($(MXE_NATIVE_BUILD),yes)
  ifeq ($(MXE_WINDOWS_BUILD),yes)
    # The corresponding test (in GraphBLAS) succeeds on Windows (MinGW-w64).
    $(PKG)_CMAKE_CROSS_FLAGS += -DHAVE_GETENV_HOME=ON
  else
    # Use fallback for other targets.
    $(PKG)_CMAKE_CROSS_FLAGS += -DHAVE_GETENV_HOME=OFF
  endif
endif

$(PKG)_MAKE_OPTS = \
    FFLAGS='$(MXE_FFLAGS)' \
    CFLAGS='$(MXE_CFLAGS)' \
    CXXFLAGS='$(MXE_CXXFLAGS)' \
    AR='$(MXE_AR)' \
    RANLIB='$(MXE_RANLIB)' \
    CMAKE_OPTIONS='-DCMAKE_TOOLCHAIN_FILE="$(CMAKE_TOOLCHAIN_FILE)" \
                   -DCOMPACT=ON -DNFORTRAN=ON \
                   -DBLA_VENDOR="Generic" -DBLAS_LIBRARIES="-lblas -lgfortran" -DLAPACK_LIBRARIES="-llapack" \
                   -DENABLE_CUDA=OFF \
                   $($(PKG)_CMAKE_FLAGS) \
                   $($(PKG)_CMAKE_CROSS_FLAGS) \
                   $(CMAKE_CCACHE_FLAGS) $(CMAKE_BUILD_SHARED_OR_STATIC)'

define $(PKG)_BUILD
    # build all
    $(MAKE) -C '$(1)' -j '$(JOBS)' \
        $($(PKG)_MAKE_OPTS)

    # install libraries and headers
    $(MAKE) -C '$(1)' -j 1 install \
        $($(PKG)_MAKE_OPTS)
endef

