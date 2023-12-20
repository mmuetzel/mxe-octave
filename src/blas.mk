# This file is part of MXE.
# See index.html for further information.

PKG             := blas
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.12.0
$(PKG)_CHECKSUM := cfad2373889602c4ecb525a3a0d355c5e7383c1b
$(PKG)_SUBDIR   := BLAS-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tgz
$(PKG)_URL      := http://www.netlib.org/$(PKG)/$($(PKG)_FILE)
$(PKG)_URL_2    := ftp://ftp.eq.uc.pt/pub/software/math/netlib/$(PKG)/$($(PKG)_FILE)
$(PKG)_DEPS     :=

ifeq ($(ENABLE_FORTRAN_INT64),yes)
  $(PKG)_DEFAULT_INTEGER_8_FLAG := -fdefault-integer-8
endif

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://www.netlib.org/blas/' | \
    $(SED) -n 's|.*>blas-\([0-9\.]*\).tgz<.*|\1|p' | $(SORT) -V | \
    tail -1
endef

$(PKG)_TARGETS =  BLASLIB=libblas.a
ifeq ($(MXE_WINDOWS_BUILD),yes)
  $(PKG)_TARGETS += XERBLALIB=libxerbla.a
  $(PKG)_LIBXERBLA = -lxerbla
endif

define $(PKG)_BUILD
  $(MAKE) -C '$(1)' \
    FC=$(MXE_F77) \
    FFLAGS='$(MXE_F77_PICFLAG) $($(PKG)_DEFAULT_INTEGER_8_FLAG)' \
    AR=$(MXE_AR) \
    RANLIB=$(MXE_RANLIB) \
    $($(PKG)_TARGETS) \
    -j '$(JOBS)'

  if [ $(BUILD_SHARED) = yes ]; then \
    if [ -n "$($(PKG)_LIBXERBLA)" ]; then \
      $(MAKE_SHARED_FROM_STATIC) --ar '$(MXE_AR)' --ld '$(MXE_F77)' '$(1)/libxerbla.a' --install '$(INSTALL)' --libdir '$(3)$(HOST_LIBDIR)' --bindir '$(3)$(HOST_BINDIR)'; \
      $(INSTALL) '$(3)/$(HOST_BINDIR)/libxerbla.dll' '$(3)$(HOST_BINDIR)/libxerbla-blas.dll'; \
    fi; \
    $(MAKE_SHARED_FROM_STATIC) --ar '$(MXE_AR)' --ld '$(MXE_F77)' '$(1)/libblas.a' --install '$(INSTALL)' --libdir '$(3)$(HOST_LIBDIR)' --bindir '$(3)$(HOST_BINDIR)' $($(PKG)_LIBXERBLA); \
  fi

  if [ $(BUILD_STATIC) = yes ]; then \
    $(INSTALL) -d '$(3)$(HOST_LIBDIR)'; \
    $(INSTALL) '$(1)/libblas.a' '$(3)$(HOST_LIBDIR)/'; \
    if [ -n "$($(PKG)_LIBXERBLA)" ]; then \
      $(INSTALL) '$(1)/libxerbla.a' '$(3)$(HOST_LIBDIR)/'; \
    fi; \
  fi
endef
