# This file is part of MXE.
# See index.html for further information.

PKG             := sqlite
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3500400
$(PKG)_CHECKSUM := 145048005c777796dd8494aa1cfed304e8c34283
$(PKG)_SUBDIR   := $(PKG)-autoconf-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-autoconf-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := http://www.sqlite.org/2025/$($(PKG)_FILE)
$(PKG)_DEPS     := readline zlib

ifeq ($(MXE_SYSTEM),mingw)
$(PKG)_DEPS     += termcap
endif

$(PKG)_CONFIGURE_OPTIONS :=
ifeq ($(MXE_SYSTEM)$(BUILD_SHARED),mingwyes)
    $(PKG)_CONFIGURE_OPTIONS += --out-implib
endif

define $(PKG)_UPDATE
    $(WGET) -q -O- 'http://www.sqlite.org/download.html' | \
    $(SED) -n 's,.*sqlite-autoconf-\([0-9][^>]*\)\.tar.*,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
    if [ $(MXE_NATIVE_BUILD) = no ]; then \
      mkdir '$(1).native' && cd '$(1).native' && '$(1)/configure' \
        --enable-static --disable-shared \
        --prefix='$(BUILD_TOOLS_PREFIX)' && \
      $(MAKE) -C '$(1).native' -j 1 install; \
    fi
    cd '$(1)' && ./configure \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        $(ENABLE_SHARED_OR_STATIC) \
        --prefix='$(HOST_PREFIX)' \
	$($(PKG)_CONFIGURE_OPTIONS) \
        CFLAGS="-Os -DSQLITE_ENABLE_COLUMN_METADATA -DSQLITE_THREADSAFE=1 -DSQLITE_ENABLE_RTREE=1" \
        --disable-readline
    $(MAKE) -C '$(1)' -j 1
    $(MAKE) -C '$(1)' -j 1 install $(MXE_DISABLE_DOCS) DESTDIR='$(3)'
endef
