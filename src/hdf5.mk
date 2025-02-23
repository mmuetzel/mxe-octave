# This file is part of MXE.
# See index.html for further information.

PKG             := hdf5
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.14.3
$(PKG)_CHECKSUM := c7f4e1f6150547504171c7210352379b96e10d5e
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.bz2
$(PKG)_URL      := https://support.hdfgroup.org/ftp/HDF5/releases/$(PKG)-$(call SHORT_PKG_VERSION,$(PKG))/$(PKG)-$($(PKG)_VERSION)/src/$($(PKG)_FILE)
$(PKG)_DEPS     := build-ninja zlib

define $(PKG)_UPDATE
    echo 'Warning: Updates are temporarily disabled for package hdf5.' >&2;
    echo $(hdf5_VERSION)
endef

ifeq ($(MXE_SYSTEM),mingw)
    ifneq ($(MXE_NATIVE_BUILD),yes)
        $(PKG)_CROSS_CONFIG_OPTIONS := \
            -DHAVE_IOEO_EXITCODE=0 \
            -DH5_LDOUBLE_TO_LONG_SPECIAL_RUN=1 \
            -DH5_LDOUBLE_TO_LONG_SPECIAL_RUN__TRYRUN_OUTPUT="" \
            -DH5_LONG_TO_LDOUBLE_SPECIAL_RUN=1 \
            -DH5_LONG_TO_LDOUBLE_SPECIAL_RUN__TRYRUN_OUTPUT="" \
            -DH5_LDOUBLE_TO_LLONG_ACCURATE_RUN=0 \
            -DH5_LDOUBLE_TO_LLONG_ACCURATE_RUN__TRYRUN_OUTPUT="" \
            -DH5_LLONG_TO_LDOUBLE_CORRECT_RUN=0 \
            -DH5_LLONG_TO_LDOUBLE_CORRECT_RUN__TRYRUN_OUTPUT="" \
            -DH5_DISABLE_SOME_LDOUBLE_CONV_RUN=1 \
            -DH5_DISABLE_SOME_LDOUBLE_CONV_RUN__TRYRUN_OUTPUT="" \
            -DH5_HAVE_ASPRINTF=OFF \
            -DH5_HAVE_VASPRINTF=OFF
    endif
endif

define $(PKG)_BUILD
    mkdir '$(1)/.build'

    cd '$(1)/.build' && cmake .. -G Ninja \
        -DCMAKE_INSTALL_PREFIX=$(HOST_PREFIX) \
        $($(PKG)_CMAKE_FLAGS) \
        $(CMAKE_CCACHE_FLAGS) \
        $(CMAKE_BUILD_SHARED_OR_STATIC) \
        -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)' \
        -DHDF5_INSTALL_BIN_DIR='$(HOST_BINDIR)' \
        -DHDF5_INSTALL_LIB_DIR='$(HOST_LIBDIR)' \
        -DHDF5_INSTALL_INCLUDE_DIR='$(HOST_INCDIR)' \
        -DHDF5_INSTALL_DATA_DIR='$(HOST_PREFIX)/share' \
        -DHDF5_BUILD_CPP_LIB=OFF \
        -DHDF5_BUILD_HL_LIB=ON \
        -DHDF5_ENABLE_Z_LIB_SUPPORT=ON \
        -DHDF5_ENABLE_SZIP_SUPPORT=OFF \
        -DHDF5_ENABLE_SZIP_ENCODING=OFF \
        -DHDF5_BUILD_DOC=OFF \
        -DBUILD_TESTING=OFF \
        $($(PKG)_CROSS_CONFIG_OPTIONS)

    cmake --build '$(1)/.build' -j '$(JOBS)' 
    DESTDIR='$(3)' cmake --install '$(1)/.build'

    # FIXME: Change the build rule to create the shared libs with the prefix
    if [ $(BUILD_STATIC) = yes ]; then \
      if test x$(MXE_SYSTEM) = xmingw; then \
        mv '$(3)/$(HOST_LIBDIR)/hdf5.lib' '$(3)/$(HOST_LIBDIR)/libhdf5.lib'; \
        mv '$(3)/$(HOST_LIBDIR)/hdf5_tools.lib' '$(3)/$(HOST_LIBDIR)/libhdf5_tools.lib'; \
        mv '$(3)/$(HOST_LIBDIR)/hdf5_hl.lib' '$(3)/$(HOST_LIBDIR)/libhdf5_hl.lib'; \
      fi; \
    fi

    if [ "$(ENABLE_DEP_DOCS)" == "no" ]; then \
        rm -rf '$(3)$(HOST_PREFIX)/share/hdf5_examples'; \
    fi
endef

