# This file is part of MXE.
# See index.html for further information.

PKG             := libntlm
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.6
$(PKG)_CHECKSUM := d6f9b69f154d82d0f9a49e9686b79fc03f21c3c6
$(PKG)_SUBDIR   := libntlm-$($(PKG)_VERSION)
$(PKG)_FILE     := libntlm-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://download.savannah.nongnu.org/releases/libntlm/$($(PKG)_FILE)
$(PKG)_DEPS     :=

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://download.savannah.nongnu.org/releases/libntlm/'  | \
    $(SED) -n 's,.*libntlm-\([0-9]\+\)\(\.[0-9]\+\)*\..*,\1\2,p' |\
    tail -1
endef

define $(PKG)_BUILD
    cd '$(1)' && ./configure \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        $(ENABLE_SHARED_OR_STATIC) \
        --prefix='$(HOST_PREFIX)'
    $(MAKE) -C '$(1)' -j 1 install bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS=
endef
