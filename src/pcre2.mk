# This file is part of MXE.
# See index.html for further information.

PKG             := pcre2
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 10.41
$(PKG)_CHECKSUM := ea443ae87a4f5ab925a69cb3090605998061faed
$(PKG)_SUBDIR   := pcre2-$($(PKG)_VERSION)
$(PKG)_FILE     := pcre2-$($(PKG)_VERSION).tar.bz2
$(PKG)_URL      := https://github.com/PCRE2Project/$(PKG)/releases/download/$(PKG)-$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_DEPS     := zlib

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,PCRE2Project,pcre2,pcre2-)
endef

define $(PKG)_BUILD
    cd '$(1)' && ./configure \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        $(ENABLE_SHARED_OR_STATIC) \
        --prefix='$(HOST_PREFIX)' \
        --enable-pcre2-16 \
        --enable-utf \
        --enable-unicode-properties \
        --enable-cpp \
        --disable-pcregrep-libz \
        --disable-pcregrep-libbz2 \
        --disable-pcretest-libreadline && $(CONFIGURE_POST_HOOK)
    rm -f '$(HOST_PREFIX)'/share/man/man3/pcre2-16*.3
    $(MAKE) -C '$(1)' -j '$(JOBS)' $(MXE_DISABLE_PROGS) DESTDIR='$(3)'
    $(MAKE) -C '$(1)' -j 1 install $(MXE_DISABLE_PROGS) DESTDIR='$(3)'
    if [ "$(ENABLE_DEP_DOCS)" == "no" ]; then \
       rm -rf "$(3)$(HOST_PREFIX)/share/doc/pcre2"; \
       rm -rf "$(3)$(HOST_PREFIX)/share/man"; \
    fi
    if [ $(MXE_NATIVE_BUILD) = no ]; then \
      $(INSTALL) -d '$(3)$(BUILD_TOOLS_PREFIX)/bin'; \
      $(INSTALL) -m755 '$(3)$(HOST_BINDIR)/pcre2-config' '$(3)$(BUILD_TOOLS_PREFIX)/bin/pcre2-config'; \
    fi
endef
