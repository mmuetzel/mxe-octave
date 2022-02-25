# This file is part of MXE.
# See index.html for further information.

PKG             := sqlite
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3380000
$(PKG)_CHECKSUM := c9a089d1e9f87b652698def57a2f01c1f4e37052
$(PKG)_SUBDIR   := $(PKG)-autoconf-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-autoconf-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := http://www.sqlite.org/2022/$($(PKG)_FILE)
$(PKG)_DEPS     := readline zlib

ifeq ($(MXE_SYSTEM),mingw)
$(PKG)_DEPS     += termcap
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
    if [ $(MXE_WINDOWS_BUILD) = yes ]; then \
      $(SED) -i 's/^Cflags/#Cflags/;' '$(1)/sqlite3.pc.in'; \
    fi
    cd '$(1)' && autoreconf && ./configure \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        $(ENABLE_SHARED_OR_STATIC) \
        --prefix='$(HOST_PREFIX)' \
        CFLAGS="-Os -DSQLITE_ENABLE_COLUMN_METADATA" \
        --disable-readline
    $(MAKE) -C '$(1)' -j 1
    $(MAKE) -C '$(1)' -j 1 install $(MXE_DISABLE_DOCS) DESTDIR='$(3)'
endef
