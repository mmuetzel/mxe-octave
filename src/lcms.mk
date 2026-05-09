# This file is part of MXE.
# See index.html for further information.

PKG             := lcms
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.19.1
$(PKG)_CHECKSUM := b66f8317db40a775cb46cc465f66eb841c11aebf
$(PKG)_SUBDIR   := $(PKG)2-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_SUBDIR).tar.gz
$(PKG)_URL      := https://github.com/mm2/Little-CMS/releases/download/$(PKG)$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_DEPS     := jpeg tiff zlib

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://github.com/mm2/Little-CMS/tags' | \
    $(SED) -n 's|.*releases/tag/lcms\([^"]*\).*|\1|p' | \
    head -1
endef

define $(PKG)_BUILD
    cd '$(1)' && ./configure \
        --prefix='$(HOST_PREFIX)' \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        $(ENABLE_SHARED_OR_STATIC) \
        --with-jpeg \
        --with-tiff \
        --with-zlib && $(CONFIGURE_POST_HOOK)
    $(MAKE) -C '$(1)' -j '$(JOBS)' install bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS= man_MANS= DESTDIR='$(3)'
endef
