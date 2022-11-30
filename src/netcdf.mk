# This file is part of MXE.
# See index.html for further information.

PKG             := netcdf
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.8.1
$(PKG)_CHECKSUM := ae9e8741aebdb3ba4494a78a7f5a32e92516edc1
$(PKG)_SUBDIR   := netcdf-c-$($(PKG)_VERSION)
$(PKG)_FILE     := netcdf-c-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/Unidata/netcdf-c/archive/v$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     := curl hdf5

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,Unidata,netcdf-c,v)
endef

ifeq ($(MXE_WINDOWS_BUILD),yes)
  $(PKG)_CONFIGURE_OPTIONS := CPPFLAGS='-DH5_USE_110_API -DDLL_NETCDF -I$(HOST_PREFIX)/include'
else
  $(PKG)_CONFIGURE_OPTIONS := CPPFLAGS='-DH5_USE_110_API -I$(HOST_PREFIX)/include'
endif

$(PKG)_CONFIGURE_POST_HOOK := $(CONFIGURE_POST_HOOK)
ifeq ($(MXE_SYSTEM),msvc)
    $(PKG)_CONFIGURE_POST_HOOK += -x
endif

define $(PKG)_BUILD
    if [ $(MXE_SYSTEM) = msvc ]; then \
        cd '$(1)' && autoreconf -f -i -v; \
    fi
    cd '$(1)' && ./configure \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
	--enable-hdf5 --disable-testsets --disable-utilities \
        $(CONFIGURE_CPPFLAGS) $(CONFIGURE_LDFLAGS) \
        $(ENABLE_SHARED_OR_STATIC) \
        --prefix='$(HOST_PREFIX)' \
        $($(PKG)_CONFIGURE_OPTIONS) \
	&& $($(PKG)_CONFIGURE_POST_HOOK)
    $(MAKE) -C '$(1)' -j '$(JOBS)' LDFLAGS='-no-undefined -L$(HOST_LIBDIR)' $(MXE_DISABLE_PROGS) $(MXE_DISABLE_DOCS) V=1
    $(MAKE) -C '$(1)' -j 1 install LDFLAGS='-no-undefined -L$(HOST_LIBDIR)' $(MXE_DISABLE_PROGS) $(MXE_DISABLE_DOCS) DESTDIR='$(3)'
  
    if [ ! "x$(MXE_NATIVE_BUILD)" = "xyes" ]; then \
      $(LN_SF) '$(HOST_BINDIR)/nc-config' '$(BUILD_TOOLS_PREFIX)/bin/$(MXE_TOOL_PREFIX)nc-config'; \
    fi
endef
