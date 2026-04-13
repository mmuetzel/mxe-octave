# This file is part of MXE.
# See index.html for further information.

PKG             := freetds
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.5.16
$(PKG)_CHECKSUM := 4537206a35e15351c612840b93e8f4d53aba6e80
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.bz2
$(PKG)_URL      := https://github.com/FreeTDS/$(PKG)/releases/download/v$($(PKG)_VERSION)/$(PKG)-$($(PKG)_VERSION).tar.bz2
$(PKG)_DEPS     := libiconv gnutls

$(PKG)_CONFIG_OPTS :=
ifeq ($(MXE_WINDOWS_BUILD),yes)
    $(PKG)_CONFIG_OPTS += --disable-threadsafe
endif

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,FreeTDS,freetds,v)
endef

define $(PKG)_BUILD
    cd '$(1)' && ./configure \
        $(CONFIGURE_CPPFLAGS) $(CONFIGURE_LDFLAGS) \
        --prefix='$(HOST_PREFIX)' \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        --disable-rpath \
        --disable-dependency-tracking \
        $(ENABLE_SHARED_OR_STATIC) \
        $($(PKG)_CONFIG_OPTS) \
        --enable-libiconv \
        --enable-msdblib \
        --enable-sspi \
        --with-tdsver=7.2 \
        --with-gnutls \
        $($(PKG)_CONFIG_OPTS) \
        PKG_CONFIG='$(MXE_PKG_CONFIG)'
    $(MAKE) -C '$(1)' -j '$(JOBS)' install $(MXE_DISABLE_DOCS) TARGET_DOCDIR='$(1)' DESTDIR='$(3)'
endef
