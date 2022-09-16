# This file is part of MXE.
# See index.html for further information.

PKG             := flac
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.4.0
$(PKG)_CHECKSUM := df471fc1f33f8b00f2330c22ecbfe485f2b9715b
$(PKG)_SUBDIR   := flac-$($(PKG)_VERSION)
$(PKG)_FILE     := flac-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := http://downloads.xiph.org/releases/flac/$($(PKG)_FILE)

$(PKG)_DEPS     := build-nasm libiconv ogg

define $(PKG)_UPDATE
    $(WGET) -q -O- 'http://downloads.xiph.org/releases/flac/' | \
    grep 'flac-' | \
    $(SED) -n 's,.*flac-\([0-9][^>]*\)\.tar.*,\1,p' | \
    tail -1
endef

define $(PKG)_BUILD
    cd '$(1)' && autoreconf -fi && ./configure \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        $(ENABLE_SHARED_OR_STATIC) \
        $(CONFIGURE_LDFLAGS) $(CONFIGURE_CPPFLAGS) \
        --prefix='$(HOST_PREFIX)' \
        --disable-doxygen-docs \
        --disable-xmms-plugin \
        --enable-cpplibs \
        --enable-ogg \
        --disable-oggtest
    $(MAKE) -C '$(1)' -j '$(JOBS)' $(MXE_DISABLE_PROGS) $(MXE_DISABLE_DOCS) VERBOSE=1
    $(MAKE) -C '$(1)' -j 1 install $(MXE_DISABLE_PROGS) $(MXE_DISABLE_DOCS) DESTDIR='$(3)'
endef
