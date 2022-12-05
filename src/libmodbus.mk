PKG             := libmodbus
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.1.9
$(PKG)_CHECKSUM := 8d5978e896c969dfe9b9d05bc09793f2c00a20a8
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_SUBDIR).tar.gz
$(PKG)_URL      := https://github.com/stephane/$(PKG)/archive/refs/tags/v$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     :=

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,stephane,libmodbus,v)
endef

define $(PKG)_BUILD
  cd '$(1)' && ./autogen.sh && ./configure \
      $(CONFIGURE_CPPFLAGS) $(CONFIGURE_LDFLAGS) \
      $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
      $(ENABLE_SHARED_OR_STATIC) \
      --without-debug \
      --prefix='$(HOST_PREFIX)' \
      && $(CONFIGURE_POST_HOOK)
 
    $(MAKE) -C '$(1)' -j '$(JOBS)' $(MXE_DISABLE_DOCS) $(MXE_DISABLE_PROGS)
    $(MAKE) -C '$(1)' -j 1 install  $(MXE_DISABLE_DOCS) $(MXE_DISABLE_PROGS) DESTDIR='$(3)'
endef

