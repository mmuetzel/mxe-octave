# This file is part of MXE.
# See index.html for further information.

PKG             := eigen
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.4.0
$(PKG)_CHECKSUM := e422a63bca97a89d8c1f63d7f47ba96d8dfcdef0
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)-3147391d946bb4b6c68edd901f2add6ac1f31f8c
$(PKG)_FILE     := $($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://gitlab.com/libeigen/$(PKG)/-/archive/$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_DEPS     :=

define $(PKG)_UPDATE
    $(WGET) -q -O- https://gitlab.com/libeigen/eigen/tags | \
    $(SED) -n 's|.*/tags/\([0-9][^"]*\).*|\1|p' | grep -v 'rc' | $(SORT) -V | \
    tail -1
endef

define $(PKG)_BUILD
    mkdir '$(1).build'
    cd '$(1).build' && \
    cmake \
        $(CMAKE_CCACHE_FLAGS) \
        $(CMAKE_BUILD_SHARED_OR_STATIC) \
        -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)' \
        '$(1)'
    $(MAKE) -C '$(1).build' -j '$(JOBS)' DESTDIR='$(3)' install
endef
