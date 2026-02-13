# This file is part of MXE.
# See index.html for further information.

PKG             := rapidjson
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.1.0
$(PKG)_CHECKSUM := a3e0d043ad3c2d7638ffefa3beb30a77c71c869f
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_SUBDIR).tar.gz
$(PKG)_URL      := https://github.com/Tencent/$(PKG)/archive/v$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     :=

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,Tencent,rapidjson,v)
endef

define $(PKG)_BUILD
    mkdir '$(1).build'
    cd '$(1).build' && \
    cmake \
        $(CMAKE_CCACHE_FLAGS) \
        $(CMAKE_BUILD_SHARED_OR_STATIC) \
        -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)' \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -DRAPIDJSON_BUILD_DOC=OFF \
        -DRAPIDJSON_BUILD_EXAMPLES=OFF \
        -DRAPIDJSON_BUILD_TESTS=OFF \
        '$(1)'
    $(MAKE) -C '$(1).build' -j '$(JOBS)' DESTDIR='$(3)' install
    if [ "$(ENABLE_DEP_DOCS)" == "no" ]; then \
       rm -rf "$(3)$(HOST_PREFIX)/share/doc/RapidJSON"; \
    fi
endef

