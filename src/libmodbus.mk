PKG             := libmodbus
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.2.0
$(PKG)_CHECKSUM := abfe6dbb9b197fb4694c4ee2bb58edb5d5eca071
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

