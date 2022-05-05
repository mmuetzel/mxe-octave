# This file is part of MXE.
# See index.html for further information.

PKG             := libxml2
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.9.14
$(PKG)_CHECKSUM := 2448a3fb2fa0ad27147a88b6b97b88162ba777bc
$(PKG)_SUBDIR   := libxml2-v$($(PKG)_VERSION)
$(PKG)_FILE     := libxml2-v$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://gitlab.gnome.org/GNOME/$(PKG)/-/archive/v$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_DEPS     := zlib libiconv

ifneq ($(MXE_SYSTEM),msvc)
    $(PKG)_DEPS := xz
endif

define $(PKG)_UPDATE
    $(WGET) -q -O- https://gitlab.gnome.org/GNOME/libxml2/tags | \
    $(SED) -n 's|.*/tags/v\([^"]*\).*|\1|p' | grep -v 'rc' | $(SORT) -V | \
    tail -1
endef

define $(PKG)_BUILD
    #$(SED) -i 's,`uname`,MinGW,g' '$(1)/xml2-config.in'
    cd '$(1)' && ./autogen.sh \
        $(CONFIGURE_CPPFLAGS) $(CONFIGURE_LDFLAGS) \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        $(ENABLE_SHARED_OR_STATIC) \
        --without-debug \
        --prefix='$(HOST_PREFIX)' \
        --with-zlib='$(HOST_PREFIX)' \
        --without-python \
        --without-threads && $(CONFIGURE_POST_HOOK)
    $(MAKE) -C '$(1)' -j '$(JOBS)' noinst_PROGRAMS=
    $(MAKE) -C '$(1)' -j 1 install noinst_PROGRAMS= DESTDIR='$(3)'

    if [ "$(ENABLE_DEP_DOCS)" == "no" ]; then \
      rm -rf "$(3)$(HOST_PREFIX)/share/gtk-doc"; \
      rm -rf "$(3)$(HOST_PREFIX)/share/doc/$($(PKG)_SUBDIR)/html"; \
      rm -rf "$(3)$(HOST_PREFIX)/share/doc/$($(PKG)_SUBDIR)/examples"; \
    fi
endef

