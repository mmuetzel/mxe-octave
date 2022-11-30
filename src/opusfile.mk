# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := opusfile
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.11
$(PKG)_CHECKSUM := fc3bf2a73be16836a16d9e55ff1097de3835dce3
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://archive.mozilla.org/pub/opus/$($(PKG)_FILE)
$(PKG)_DEPS     := ogg opus

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://archive.mozilla.org/pub/opus/?C=M;O=D' | \
    $(SED) -n 's,.*opusfile-\([0-9][^>]*\)\.tar.*,\1,p' | \
    grep -v 'alpha' | \
    grep -v 'beta' | \
    $(SORT) -Vr | \
    head -1
endef

$(PKG)_EXTRA_CONFIGURE_OPTIONS :=

define $(PKG)_BUILD
    cd '$(1)' && ./configure \
        $(CONFIGURE_CPPFLAGS) $(CONFIGURE_LDFLAGS) \
        $($(PKG)_EXTRA_CONFIGURE_OPTIONS) \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        $(ENABLE_SHARED_OR_STATIC) \
	--prefix='$(HOST_PREFIX)' \
	--disable-doc \
	--disable-http \
	&& $(CONFIGURE_POST_HOOK)
    $(MAKE) -C '$(1)' -j '$(JOBS)' $(MXE_DISABLE_PROGS)
    $(MAKE) -C '$(1)' -j 1 install $(MXE_DISABLE_PROGS) $(MXE_DISABLE_DOCS) DESTDIR='$(3)'
endef
