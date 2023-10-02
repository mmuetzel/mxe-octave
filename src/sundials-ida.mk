# This file is part of MXE.
# See index.html for further information.

PKG             := sundials-ida
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 6.6.1
$(PKG)_CHECKSUM := 6cdd07acbea7c97b0d7b4d0baa9030f00f8846c5
$(PKG)_SUBDIR   := sundials-$($(PKG)_VERSION)
$(PKG)_FILE     := sundials-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/LLNL/sundials/releases/download/v$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_DEPS     := lapack suitesparse
ifeq ($(USE_SYSTEM_GCC),no)
  $(PKG)_DEPS += libgomp
endif

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,LLNL,sundials,v)
endef

ifeq ($(MXE_WINDOWS_BUILD),yes)
    $(PKG)_SUITESPARSECONFIG_LIBRARY := $(HOST_LIBDIR)/libsuitesparseconfig.dll.a
else
  ifeq ($(MXE_USE_LIB64_DIRECTORY),yes)
    $(PKG)_SUITESPARSECONFIG_LIBRARY := $(HOST_LIB64DIR)/libsuitesparseconfig.so
  else
    $(PKG)_SUITESPARSECONFIG_LIBRARY := $(HOST_LIBDIR)/libsuitesparseconfig.so
  endif
endif

# Keep "sunindextype" in sync with LAPACK (bug #58795)
ifeq ($(ENABLE_FORTRAN_INT64),yes)
    $(PKG)_INDEX_SIZE := 64
else
    $(PKG)_INDEX_SIZE := 32
endif

define $(PKG)_BUILD
    mkdir '$(1).build'
    cd '$(1).build' && cmake \
        $(CMAKE_CCACHE_FLAGS) \
        $(CMAKE_BUILD_SHARED_OR_STATIC) \
        -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)' \
        -DBUILD_ARKODE=OFF \
        -DBUILD_CVODE=OFF \
        -DBUILD_CVODES=OFF \
        -DBUILD_IDA=ON \
        -DBUILD_IDAS=OFF \
        -DBUILD_KINSOL=OFF \
        -DBUILD_CPODES=OFF \
        -DEXAMPLES_ENABLE_C=OFF \
        -DSUITESPARSECONFIG_LIBRARY=$($(PKG)_SUITESPARSECONFIG_LIBRARY) \
        -DSUNDIALS_INDEX_SIZE=$($(PKG)_INDEX_SIZE) \
        -DKLU_ENABLE=ON \
        -DKLU_INCLUDE_DIR=$(HOST_INCDIR)/suitesparse \
        -DKLU_LIBRARY_DIR=$(HOST_LIBDIR) \
        '$(1)'
    $(MAKE) -C '$(1).build' -j '$(JOBS)' install DESTDIR='$(3)' VERBOSE=1

    if [ $(MXE_SYSTEM) = mingw ]; then \
        echo "Install dlls"; \
        $(INSTALL) -d '$(3)$(HOST_BINDIR)'; \
        mv '$(3)$(HOST_LIBDIR)/'libsundials*.dll '$(3)$(HOST_BINDIR)/'; \
    fi
endef
