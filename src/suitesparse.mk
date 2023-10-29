# This file is part of MXE.
# See index.html for further information.

PKG             := suitesparse
$(PKG)_VERSION  := 7.3.0
$(PKG)_CHECKSUM := 
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

ifneq ($(BUILD_STATIC),yes)
  $(PKG)_CMAKE_FLAGS += -DNSTATIC=ON
endif

$(PKG)_MAKE_OPTS = \
    FFLAGS='$(MXE_FFLAGS)' \
    CFLAGS='$(MXE_CFLAGS)' \
    CXXFLAGS='$(MXE_CXXFLAGS)' \
    AR='$(MXE_AR)' \
    RANLIB='$(MXE_RANLIB)' \
    CMAKE_OPTIONS='-DCMAKE_TOOLCHAIN_FILE="$(CMAKE_TOOLCHAIN_FILE)" \
                   -DCOMPACT=ON -DNOPENMP=ON \
                   -DBLA_VENDOR="Generic" -DBLAS_LIBRARIES="-lblas -lgfortran" -DLAPACK_LIBRARIES="-llapack" \
                   -DENABLE_CUDA=OFF \
                   $($(PKG)_CMAKE_FLAGS) \
                   $(CMAKE_CCACHE_FLAGS) $(CMAKE_BUILD_SHARED_OR_STATIC)'

define $(PKG)_BUILD
    # build all
    $(MAKE) -C '$(1)' -j '$(JOBS)' \
        $($(PKG)_MAKE_OPTS)

    # install libraries and headers
    $(MAKE) -C '$(1)' -j 1 install \
        $($(PKG)_MAKE_OPTS)
endef

