# This file is part of MXE.
# See index.html for further information.

PKG             := build-gettext
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.21
$(PKG)_CHECKSUM := e6c0a0cba5b00a604c9118403a8199c77a538526
$(PKG)_SUBDIR   := gettext-$($(PKG)_VERSION)
$(PKG)_FILE     := gettext-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := ftp://ftp.gnu.org/pub/gnu/gettext/$($(PKG)_FILE)
$(PKG)_DEPS     := 

define $(PKG)_UPDATE
    $(WGET) -q -O- 'http://ftp.gnu.org/gnu/gettext/?C=M;O=D' | \
    $(SED) -n 's,.*<a href="gettext-\([0-9\.]*\)\.tar.*,\1,p' | \
    $(SORT) -V | \
    tail -1
endef

define $(PKG)_BUILD
    mkdir '$(1)/gettext-runtime/.build'
    cd    '$(1)/gettext-runtime/.build' && '$(1)/gettext-runtime/configure' \
        --prefix='$(BUILD_TOOLS_PREFIX)' \
        --without-libexpat-prefix \
        --without-libxml2-prefix \
	$($(PKG)_CONFIGURE_OPTIONS)
    $(MAKE) -C '$(1)/gettext-runtime/.build/intl' -j $(JOBS)
    if test x$(MXE_SYSTEM) = xmsvc; then \
        cd '$(1)/gettext-runtime/.build/intl' && $(CONFIGURE_POST_HOOK); \
    fi
    $(MAKE) -C '$(1)/gettext-runtime/.build/intl' -j 1 $(MXE_DISABLE_DOCS) install DESTDIR='$(3)'

    mkdir '$(1)/gettext-tools/.build'
    cd    '$(1)/gettext-tools/.build' && '$(1)/gettext-tools/configure' \
        --prefix='$(BUILD_TOOLS_PREFIX)' \
        --without-libexpat-prefix \
        --without-libxml2-prefix \
	$($(PKG)_CONFIGURE_OPTIONS)
    $(MAKE) -C '$(1)/gettext-tools/.build/intl' -j $(JOBS)
    if test x$(MXE_SYSTEM) = xmsvc; then \
        cd '$(1)/gettext-tools/.build/intl' && $(CONFIGURE_POST_HOOK); \
    fi
    $(MAKE) -C '$(1)/gettext-tools/.build/intl' -j 1 $(MXE_DISABLE_DOCS) install DESTDIR='$(3)'
endef
