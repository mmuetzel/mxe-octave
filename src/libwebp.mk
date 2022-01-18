# This file is part of MXE.
# See index.html for further information.

PKG             := libwebp
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.2.1
$(PKG)_CHECKSUM := 9bbc3cb6f90dccafbd3e39325c28f24ac3f6e041
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://storage.googleapis.com/downloads.webmproject.org/releases/webp/$($(PKG)_FILE)
$(PKG)_DEPS     :=

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://developers.google.com/speed/webp/download' | \
    $(SED) -n 's,.*<a href="//storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-\([0-9][^"]*\)\.tar.gz">Download</a> |,\1,p' | \
    $(SORT) -V | \
    tail -1
endef

define $(PKG)_BUILD
    cd '$(1)' && ./configure \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        $(ENABLE_SHARED_OR_STATIC) \
        --prefix='$(HOST_PREFIX)' \
	--enable-everything
    $(MAKE) -C '$(1)' -j '$(JOBS)' install bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS= man=MANS=
endef
