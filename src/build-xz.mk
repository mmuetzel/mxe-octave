# This file is part of MXE.
# See index.html for further information.

PKG             := build-xz
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 5.4.4
$(PKG)_CHECKSUM := a7ba54953bafe4ba02936be56f32391f48806fed
$(PKG)_SUBDIR   := xz-$($(PKG)_VERSION)
$(PKG)_FILE     := xz-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := http://tukaani.org/xz/$($(PKG)_FILE)
$(PKG)_DEPS     := build-gettext

define $(PKG)_UPDATE
    $(WGET) -q -O- 'http://tukaani.org/xz/' | \
    $(SED) -n 's,.*xz-\([0-9][^>]*\)\.tar.*,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
    cd '$(1)' && autoreconf -fi && './configure' \
        --prefix='$(BUILD_TOOLS_PREFIX)' \
        $(ENABLE_SHARED_OR_STATIC) \
        --disable-threads \
        --disable-nls
    $(MAKE) -C '$(1)' -j '$(JOBS)' install DESTDIR='$(3)'
endef
