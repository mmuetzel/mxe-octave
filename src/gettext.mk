# This file is part of MXE.
# See index.html for further information.

PKG             := gettext
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.22.3
$(PKG)_CHECKSUM := e078a6a89238dfbb0999012955dfa6e598e1c0a6
$(PKG)_SUBDIR   := gettext-$($(PKG)_VERSION)
$(PKG)_FILE     := gettext-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := ftp://ftp.gnu.org/pub/gnu/gettext/$($(PKG)_FILE)
$(PKG)_DEPS     := libiconv

define $(PKG)_UPDATE
    $(WGET) -q -O- 'http://ftp.gnu.org/gnu/gettext/' | \
    grep 'gettext-' | \
    $(SED) -n 's,.*gettext-\([0-9][^>]*\)\.tar.*,\1,p' | \
    $(SORT) -Vr | \
    head -1
endef

define $(PKG)_BUILD
    # while we are patching stuff, we may need to run reconf
    cd '$(1)' && aclocal && libtoolize --automake --copy --force
    cd '$(1)' && WANT_AUTOMAKE=latest ./autogen.sh --skip-gnulib
    cd '$(1)/gettext-runtime' && ./configure \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        $(ENABLE_SHARED_OR_STATIC) \
        --prefix='$(HOST_PREFIX)' \
        --enable-threads=win32 \
        --without-libexpat-prefix \
        --without-libxml2-prefix \
        CONFIG_SHELL=$(SHELL) && $(CONFIGURE_POST_HOOK)
    $(MAKE) -C '$(1)/gettext-runtime/intl' -j '$(JOBS)' 
    $(MAKE) -C '$(1)/gettext-runtime/intl' -j 1 $(MXE_DISABLE_DOCS) install DESTDIR='$(3)'
endef
