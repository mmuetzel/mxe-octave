# This file is part of MXE.
# See index.html for further information.

PKG             := libsodium
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.0.19
$(PKG)_CHECKSUM := 1a066919a2328e9bc2ad4af80f443ebb1458ca3f
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)-RELEASE
$(PKG)_FILE     := $($(PKG)_SUBDIR).tar.gz
$(PKG)_URL      := https://github.com/jedisct1/$(PKG)/archive/refs/tags/$($(PKG)_VERSION)-RELEASE.tar.gz
$(PKG)_DEPS     :=

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,jedisct1,libsodium,)
endef

$(PKG)_EXTRA_CONFIGURE_OPTIONS :=
ifneq ($(filter mingw msvc,$(MXE_SYSTEM)),)
    $(PKG)_EXTRA_CONFIGURE_OPTIONS += CFLAGS="-O2 -g -fstack-protector"
endif

define $(PKG)_BUILD
    cd '$(1)' && ./autogen.sh \
    cd '$(1)' && ./configure \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        --prefix='$(HOST_PREFIX)' \
        $($(PKG)_EXTRA_CONFIGURE_OPTIONS) \
        $(ENABLE_SHARED_OR_STATIC) 

    $(MAKE) -C '$(1)' -j '$(JOBS)'
    $(MAKE) -C '$(1)' -j 1 install DESTDIR='$(3)' $(MXE_DISABLE_PROGS) $(MXE_DISABLE_DOCS)
endef
