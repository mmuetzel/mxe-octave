# This file is part of MXE.
# See index.html for further information.

PKG             := gdcm
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.2.5
$(PKG)_CHECKSUM := 2f6afc9392aa1f0a87a63107e835299bea169422
$(PKG)_SUBDIR   := GDCM-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/malaterre/GDCM/archive/v$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     := expat zlib build-ninja

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,malaterre,GDCM,v)
endef

ifeq ($(MXE_SYSTEM),msvc)
    define $(PKG)_BUILD
        mkdir '$(1)/../.build'
        cd '$(1)/../.build' && cmake \
            -G "NMake Makefiles" \
            $(CMAKE_CCACHE_FLAGS) \
            $(CMAKE_BUILD_SHARED_OR_STATIC) \
            -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)'  \
            -DGDCM_BUILD_SHARED_LIBS:BOOL=TRUE \
            -DGDCM_USE_SYSTEM_ZLIB:BOOL=TRUE \
            -DGDCM_USE_SYSTEM_EXPAT:BOOL=TRUE \
            -DGDCM_BUILD_TESTING:BOOL=FALSE \
            -DGDCM_DOCUMENTATION:BOOL=FALSE \
            -DGDCM_BUILD_DOCBOOK_MANPAGES:BOOL=FALSE \
            ../$($(PKG)_SUBDIR)

        cd '$(1)/../.build' && \
            env -u MAKE -u MAKEFLAGS nmake && \
            env -u MAKE -u MAKEFLAGS nmake install
    endef
else
    define $(PKG)_BUILD
        mkdir '$(1)/../.build'
        cd '$(1)/../.build' && cmake \
            -GNinja \
            $(CMAKE_CCACHE_FLAGS) \
            $(CMAKE_BUILD_SHARED_OR_STATIC) \
            -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)'  \
            -DGDCM_BUILD_SHARED_LIBS:BOOL=TRUE \
            -DGDCM_BUILD_TESTING:BOOL=FALSE \
            -DGDCM_DOCUMENTATION:BOOL=FALSE \
            -DGDCM_BUILD_DOCBOOK_MANPAGES:BOOL=FALSE \
            ../$($(PKG)_SUBDIR)

        cmake --build $(1)/../.build -j $(JOBS) 
        DESTDIR=$(3) cmake --install $(1)/../.build
    endef

endif
