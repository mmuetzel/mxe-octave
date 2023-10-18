# This file is part of MXE.
# See index.html for further information.

PKG             := netcdf
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.9.2
$(PKG)_CHECKSUM := 0eb6fdcbd725bd53bb9e98405a2cb15f3c511ce2
$(PKG)_SUBDIR   := netcdf-c-$($(PKG)_VERSION)
$(PKG)_FILE     := netcdf-c-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/Unidata/netcdf-c/archive/v$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     := curl hdf5

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,Unidata,netcdf-c,v)
endef

define $(PKG)_BUILD
    cd '$(1)' && cmake \
        $($(PKG)_CMAKE_FLAGS) \
        -DBUILD_UTILITIES=OFF \
        -DENABLE_EXAMPLES=OFF \
        -DENABLE_TESTS=OFF \
        -DENABLE_PARALLEL_TESTS=OFF \
        -DENABLE_DAP_REMOTE_TESTS=OFF \
        -DENABLE_DAP=ON \
        -DENABLE_NETCDF_4=ON \
        -DENABLE_BYTERANGE=OFF \
        -DENABLE_LOGGING=ON \
        -DBUILD_TESTING=no \
        $(CMAKE_CCACHE_FLAGS) \
        $(CMAKE_BUILD_SHARED_OR_STATIC) \
        -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)' \
        .

    $(MAKE) -C '$(1)' -j '$(JOBS)' VERBOSE=1
    $(MAKE) -C '$(1)' -j '1' VERBOSE=1 DESTDIR='$(3)' install

    if [ ! "x$(MXE_NATIVE_BUILD)" = "xyes" ]; then \
      $(LN_SF) '$(HOST_BINDIR)/nc-config' '$(BUILD_TOOLS_PREFIX)/bin/$(MXE_TOOL_PREFIX)nc-config'; \
    fi
endef
