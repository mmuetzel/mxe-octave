# This file is part of MXE.
# See index.html for further information.

PKG             := json-c
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.13.1
$(PKG)_CHECKSUM := a339bae346e58d1737a7909794f432b097dd31cf
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION)-nodoc.tar.gz
$(PKG)_URL      := https://$(PKG)_releases.s3.amazonaws.com/releases/$($(PKG)_FILE)
$(PKG)_DEPS     :=

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://json-c_releases.s3.amazonaws.com' | \
    $(SED) -r 's,<Key>,\n<Key>,g' | \
    $(SED) -n 's,.*releases/json-c-\([0-9.]*\).tar.gz.*,\1,p' | \
    $(SORT) -V | \
    tail -1
endef

define $(PKG)_BUILD
    cd '$(1)' && ./autogen.sh
    cd '$(1)' && ./configure \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        --prefix='$(HOST_PREFIX)' \
        $(ENABLE_SHARED_OR_STATIC)
        CFLAGS=-Wno-error
    $(MAKE) -C '$(1)' -j '$(JOBS)' install DEST='$(3)'
endef
