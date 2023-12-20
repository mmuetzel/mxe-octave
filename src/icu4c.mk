PKG             := icu4c
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 74.2
$(PKG)_CHECKSUM := 20639a7bde8ab717ed15a888ce0620311c004727
$(PKG)_SUBDIR   := icu-release-$(subst .,-,$($(PKG)_VERSION))/icu4c
$(PKG)_FILE     := $(PKG)-$(subst .,-,$($(PKG)_VERSION)).tar.gz
$(PKG)_URL      := https://github.com/unicode-org/icu/archive/refs/tags/release-$(subst .,-,$($(PKG)_VERSION)).tar.gz
$(PKG)_DEPS     :=

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://github.com/unicode-org/icu/tags' | \
    $(SED) -n 's|.*releases/tag/release-\([0-9\-]*\).*|\1|p' | \
    $(SED) 's|-|\.|g' | \
    $(SORT) -V | \
    tail -1
endef

ifeq ($(MXE_NATIVE_BUILD),no)
  define $(PKG)_BUILD
    # build some native tools
    mkdir '$(1).native' && cd '$(1).native' && \
      '$(1)/source/configure' CC=gcc CXX=g++
    $(MAKE) -C '$(1).native' -j '$(JOBS)'

    # build cross
    mkdir '$(1).cross' && cd '$(1).cross' && \
      '$(1)/source/configure' \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        $(ENABLE_SHARED_OR_STATIC) \
        --prefix='$(HOST_PREFIX)' \
        --with-cross-build='$(1).native' \
        PKG_CONFIG='$(MXE_PKG_CONFIG)' \
        PKG_CONFIG_PATH=$($(PKG)_PKG_CONFIG_PATH) \
        CPPFLAGS='-DU_USING_ICU_NAMESPACE=0'

    $(MAKE) -C '$(1).cross' -j '$(JOBS)' $(MXE_DISABLE_DOCS) $(MXE_DISABLE_PROGS)
    $(MAKE) -C '$(1).cross' -j 1 install $(MXE_DISABLE_DOCS) $(MXE_DISABLE_PROGS) DESTDIR='$(3)'
    $(INSTALL) -d '$(3)$(HOST_BINDIR)'
    # mv -fv $(3)$(HOST_LIBDIR)/icu*.dll '$(3)$(HOST_BINDIR)/'
    $(INSTALL) -d '$(3)$(BUILD_TOOLS_PREFIX)/bin/'
    $(LN_SF) '$(HOST_BINDIR)/icu-config' '$(3)$(BUILD_TOOLS_PREFIX)/bin/$(MXE_TOOL_PREFIX)icu-config'
  endef
else
  define $(PKG)_BUILD
    mkdir '$(1).native' && cd '$(1).native' && \
      '$(1)/source/configure' \
        CC=$(MXE_CC) CXX=$(MXE_CXX) AR=$(MXE_AR) \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        $(ENABLE_SHARED_OR_STATIC) \
        PKG_CONFIG='$(MXE_PKG_CONFIG)' \
        PKG_CONFIG_PATH="$(HOST_LIBDIR)/pkgconfig" \
        --prefix='$(HOST_PREFIX)'
    $(MAKE) -C '$(1).native' -j '$(JOBS)' $(MXE_DISABLE_DOCS) $(MXE_DISABLE_PROGS)
    $(MAKE) -C '$(1).native' -j 1 install $(MXE_DISABLE_DOCS) $(MXE_DISABLE_PROGS)
  endef
endif

