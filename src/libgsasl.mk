# This file is part of MXE.
# See index.html for further information.

PKG             := libgsasl
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.2.1
$(PKG)_CHECKSUM := c238b3af05af3804808cbf734f049a06840d787c
$(PKG)_SUBDIR   := gsasl-$($(PKG)_VERSION)
$(PKG)_FILE     := gsasl-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://ftp.gnu.org/gnu/gsasl/$($(PKG)_FILE)
$(PKG)_DEPS     := libiconv libidn libntlm libgcrypt nettle

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://git.savannah.gnu.org/gitweb/?p=gsasl.git;a=tags' | \
    $(SED) -n 's,.*<a[^>]*>v\([0-9]*\.[0-9]*[02468]\.[^<]*\)<.*,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
    cd '$(1)' && touch src/libgsasl-7.def && ./configure \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        $(ENABLE_SHARED_OR_STATIC) \
        --prefix='$(HOST_PREFIX)' \
        --disable-nls \
        --with-libgcrypt \
        --with-libgcrypt-prefix='$(HOST_PREFIX)' \
        --with-libiconv-prefix='$(HOST_PREFIX)' \
        --with-libidn-prefix='$(HOST_PREFIX)' \
        --with-libntlm-prefix='$(HOST_PREFIX)'

    $(MAKE) -C '$(1)' -j '$(JOBS)' $(MXE_DISABLE_PROGS) $(MXE_DISABLE_DOCS)
    $(MAKE) -C '$(1)' -j 1 install $(MXE_DISABLE_PROGS) $(MXE_DISABLE_DOCS) DESTDIR='$(3)'
endef
