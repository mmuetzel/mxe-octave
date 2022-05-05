# This file is part of MXE.
# See index.html for further information.

PKG             := xvidcore
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.3.7
$(PKG)_CHECKSUM := e6f2f5a65bccdf8d2413557df7ba6d31b7ac9be3
$(PKG)_SUBDIR   := xvidcore/build/generic
$(PKG)_FILE     := xvidcore-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://downloads.xvid.com/downloads/$($(PKG)_FILE)
$(PKG)_DEPS     := pthreads

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://labs.xvid.com/source/' | \
    $(SED) -n 's,.*xvidcore-\([0-9][^ ]*\)\.tar.*,\1,p' | \
    head -1
endef

ifeq ($(MXE_NATIVE_BUILD),no)
define $(PKG)_BUILD
    cd '$(1)' && autoconf
    cd '$(1)' && ./configure \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        --prefix='$(HOST_PREFIX)'
    $(MAKE) -C '$(1)' -j '$(JOBS)' BUILD_DIR='build' $(if $(filter $(BUILD_STATIC), yes),SHARED,STATIC)_LIB=
    $(INSTALL) -d '$(HOST_INCDIR)'
    $(INSTALL) -m644 '$(1)/../../src/xvid.h' '$(HOST_INCDIR)'
    $(INSTALL) -d '$(HOST_LIBDIR)'
    $(INSTALL) -d '$(HOST_BINDIR)'
    if [ "x$(BUILD_STATIC)" == "xyes" ]; then \
      $(INSTALL) -m644 '$(1)/build/xvidcore.a' '$(HOST_LIBDIR)/libxvidcore.a'; \
    else \
      $(INSTALL) -m644 '$(1)/build/xvidcore.dll.a' '$(HOST_LIBDIR)/libxvidcore.dll.a'; \
      $(INSTALL) -m644 '$(1)/build/xvidcore.dll' '$(HOST_BINDIR)/'; \
    fi
endef
else
define $(PKG)_BUILD
    cd '$(1)' && autoconf
    cd '$(1)' && ./configure \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        --prefix='$(HOST_PREFIX)' \
        $(ENABLE_SHARED_OR_STATIC) \
        --prefix='$(HOST_PREFIX)'
    $(MAKE) -C '$(1)' -j '$(JOBS)' BUILD_DIR='build'
    $(MAKE) -C '$(1)' -j 1 BUILD_DIR='build' install
endef
endif
