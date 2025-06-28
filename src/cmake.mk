# This file is part of MXE.
# See index.html for further information.

PKG             := cmake
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.0.3
$(PKG)_CHECKSUM := 6899c8d69ba2bf1f24c6f27bcea4162e1488694b
$(PKG)_SUBDIR   := cmake-$($(PKG)_VERSION)
$(PKG)_FILE     := cmake-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := http://www.cmake.org/files/v$(call SHORT_PKG_VERSION,$(PKG))/$($(PKG)_FILE)
$(PKG)_DEPS     := bzip2 curl expat xz zlib

$(PKG)_CMAKE_OPTS :=
ifeq ($(MXE_NATIVE_MINGW_BUILD),yes)
  ifeq ($(MXE_SYSTEM),mingw)
    $(PKG)_CMAKE_OPTS := -G "MSYS Makefiles" 
  endif
else
  ifeq ($(MXE_SYSTEM),mingw)
    $(PKG)_CMAKE_OPTS += -DKWSYS_LFS_WORKS=TRUE \
        -DCMAKE_USE_SYSTEM_CURL=ON \
        -DZLIB_WINAPI_EXITCODE=0 \
        -DZLIB_WINAPI_EXITCODE__TRYRUN_OUTPUT=''
  endif
endif

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,Kitware,CMake,v)
endef

define $(PKG)_BUILD
    mkdir '$(1).build'
    cd '$(1).build' && cmake \
        $($(PKG)_CMAKE_OPTS) \
        $(CMAKE_CCACHE_FLAGS) \
        $(CMAKE_BUILD_SHARED_OR_STATIC) \
        -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)' \
        -DBUILD_TESTING=OFF \
        ../$($(PKG)_SUBDIR)
    $(MAKE) -C '$(1).build' -j '$(JOBS)'
    $(MAKE) -C '$(1).build' -j 1 install DESTDIR='$(3)'
endef
