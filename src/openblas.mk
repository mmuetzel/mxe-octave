# This file is part of MXE.
# See index.html for further information.

PKG             := openblas
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.3.23
$(PKG)_CHECKSUM := 6b781727c7b95850ae4a3eb0a391492eb4f3e780
$(PKG)_SUBDIR   := OpenBLAS-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_SUBDIR).tar.gz
$(PKG)_URL      := https://github.com/xianyi/OpenBLAS/archive/v$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     := blas

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,xianyi,OpenBLAS,v)
endef

ifeq ($(USE_CCACHE),yes)
  $(PKG)_MXE_CC := $(shell basename $(MXE_CC))
  $(PKG)_MXE_F77 := $(shell basename $(MXE_F77))
else
  $(PKG)_MXE_CC := $(MXE_CC)
  $(PKG)_MXE_F77 := $(MXE_F77)
endif

$(PKG)_MAKE_OPTS := \
  PREFIX=$(HOST_PREFIX) \
  DYNAMIC_ARCH=1 DYNAMIC_OLDER=1 TARGET=GENERIC \
  NO_LAPACK=1 NO_CBLAS=1 \
  USE_THREAD=1 NUM_THREADS=24 \
  CC=$($(PKG)_MXE_CC) FC=$($(PKG)_MXE_F77)
## This may also be needed on some systems: NO_AVX2=1

ifneq ($(MXE_NATIVE_BUILD),yes)
  $(PKG)_MAKE_OPTS += HOSTCC=gcc HOSTFC=gfortran CROSS=1 CROSS_SUFFIX=$(MXE_TOOL_PREFIX)
endif

ifeq ($(MXE_WINDOWS_BUILD),yes)
  $(PKG)_MAKE_OPTS += EXTRALIB=-lxerbla
endif

ifeq ($(ENABLE_FORTRAN_INT64),yes)
  $(PKG)_MAKE_OPTS += BINARY=64 INTERFACE64=1
endif

define $(PKG)_BUILD
    $(MAKE) -C '$(1)' -j '$(JOBS)' $($(PKG)_MAKE_OPTS)  
    $(MAKE) -C '$(1)' -j 1 $($(PKG)_MAKE_OPTS) install
endef
