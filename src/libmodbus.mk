PKG             := libmodbus
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.1.7
$(PKG)_CHECKSUM := 71d0aa223f21ddfacc8a2461f2e3e0c77e128efb
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_SUBDIR).tar.gz
$(PKG)_URL      := https://libmodbus.org/releases/$($(PKG)_FILE)
$(PKG)_DEPS     :=

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://github.com/stephane/libmodbus/tags' | \
    $(SED) -n 's|.*releases/tag/v\([^"]*\).*|\1|p' | $(SORT) -V | \
    tail -1
endef

define $(PKG)_BUILD
  cd '$(1)' && ./configure \
      $(CONFIGURE_CPPFLAGS) $(CONFIGURE_LDFLAGS) \
      $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
      $(ENABLE_SHARED_OR_STATIC) \
      --without-debug \
      --prefix='$(HOST_PREFIX)' \
      && $(CONFIGURE_POST_HOOK)
 
    $(MAKE) -C '$(1)' -j '$(JOBS)' $(MXE_DISABLE_DOCS) $(MXE_DISABLE_PROGS)
    $(MAKE) -C '$(1)' -j 1 install  $(MXE_DISABLE_DOCS) $(MXE_DISABLE_PROGS) DESTDIR='$(3)'
endef

