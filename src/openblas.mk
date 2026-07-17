# This file is part of MXE.
# See index.html for further information.

PKG             := openblas
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.3.34
$(PKG)_CHECKSUM := f7f08b47b8504da659f1400bf48eba667c6df8ea
$(PKG)_SUBDIR   := OpenBLAS-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_SUBDIR).tar.gz
$(PKG)_URL      := https://github.com/xianyi/OpenBLAS/archive/v$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     := lapack

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
    $(MAKE) -C '$(1)' -j '$(JOBS)' MAKE_NB_JOBS=$(JOBS) $($(PKG)_MAKE_OPTS)  
    $(MAKE) -C '$(1)' -j 1 $($(PKG)_MAKE_OPTS) install
endef
