# This file is part of MXE.
# See index.html for further information.

PKG             := mariadb-connector-c
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.4.8
$(PKG)_CHECKSUM := 7188edf61cd393368cc011710fd3609edefd235c
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/mariadb-corporation/$(PKG)/archive/v$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     := zlib zstd
$(PKG)_CMAKE_FLAGS :=

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,mariadb-corporation,mariadb-connector-c,v)
endef

define $(PKG)_BUILD
    cd '$(1)' && cmake \
        $($(PKG)_CMAKE_FLAGS) \
        -DBUILD_TESTING=no \
        -DWITH_CURL=OFF \
        -DWITH_EXTERNAL_ZLIB=ON \
        -DWITH_SSL=SCHANNEL \
        -DWITH_UNIT_TESTS=OFF \
        $(CMAKE_CCACHE_FLAGS) \
        $(CMAKE_BUILD_SHARED_OR_STATIC) \
        -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)' \
        .

    $(MAKE) -C '$(1)' -j '$(JOBS)' VERBOSE=1
    $(MAKE) -C '$(1)' -j '1' VERBOSE=1 DESTDIR='$(3)' install

    if [ $(MXE_SYSTEM) = mingw ]; then \
        $(INSTALL) -d '$(3)$(HOST_BINDIR)'; \
        mv '$(3)$(HOST_LIBDIR)/mariadb/libmariadb.dll' '$(3)$(HOST_BINDIR)/'; \
        mv '$(3)$(HOST_LIBDIR)/mariadb/liblibmariadb.dll.a' '$(3)$(HOST_LIBDIR)/libmariadb.dll.a'; \
    fi
endef
