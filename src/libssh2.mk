# This file is part of MXE.
# See index.html for further information.

PKG             := libssh2
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.11.0
$(PKG)_CHECKSUM := fbdb4751a4bc93e895e9c3426f7f80b437d250fe
$(PKG)_SUBDIR   := libssh2-$($(PKG)_VERSION)
$(PKG)_FILE     := libssh2-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://www.libssh2.org/download/$($(PKG)_FILE)
$(PKG)_DEPS     := libgcrypt zlib

ifeq ($(MXE_SYSTEM),mingw)
    $(PKG)_CONFIGURE_OPTIONS := --disable-rpath
endif

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://www.libssh2.org/download/?C=M;O=D' | \
    grep 'libssh2-' | \
    $(SED) -n 's,.*libssh2-\([0-9][^>]*\)\.tar.*,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
    cd '$(1)' && ./configure \
        $(CONFIGURE_CPPFLAGS) $(CONFIGURE_LDFLAGS) \
	$($(PKG)_CONFIGURE_OPTIONS) \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        $(ENABLE_SHARED_OR_STATIC) \
        --prefix='$(HOST_PREFIX)' \
        --disable-examples-build \
        --without-openssl \
        --with-libgcrypt \
        PKG_CONFIG='$(MXE_PKG_CONFIG)' && $(CONFIGURE_POST_HOOK)
    $(MAKE) -C '$(1)' -j '$(JOBS)' install $(MXE_DISABLE_PROGS) $(MXE_DISABLE_DOCS) DESTDIR='$(3)'

endef
