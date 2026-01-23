# This file is part of MXE.
# See index.html for further information.

PKG             := netcdf
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.9.3
$(PKG)_CHECKSUM := 154077e50adc53505a26b83e011ffa50280c6ec9
$(PKG)_SUBDIR   := netcdf-c-$($(PKG)_VERSION)
$(PKG)_FILE     := netcdf-c-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/Unidata/netcdf-c/archive/v$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     := curl hdf5

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,Unidata,netcdf-c,v)
endef

$(PKG)_CMAKE_OPTIONS := 
ifeq ($(TARGET),i686-w64-mingw32)
 $(PKG)_CMAKE_OPTIONS += -DNETCDF_ENABLE_FILTER_BZ2=OFF
endif

define $(PKG)_BUILD
    cd '$(1)' && cmake \
        $($(PKG)_CMAKE_FLAGS) \
        -DNETCDF_BUILD_UTILITIES=OFF \
        -DNETCDF_ENABLE_EXAMPLES=OFF \
        -DNETCDF_ENABLE_TESTS=OFF \
        -DNETCDF_ENABLE_PARALLEL_TESTS=OFF \
        -DNETCDF_ENABLE_DAP=ON \
        -DNETCDF_ENABLE_HDF5=ON \
        -DNETCDF_ENABLE_BYTERANGE=ON \
        -DNETCDF_ENABLE_LOGGING=ON \
        -DNETCDF_ENABLE_PLUGINS=ON \
        -DBUILD_TESTING=no \
        $($(PKG)_CMAKE_OPTIONS) \
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
