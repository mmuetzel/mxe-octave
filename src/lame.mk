# This file is part of MXE.
# See index.html for further information.

PKG             := lame
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.0
$(PKG)_CHECKSUM := e3630adf399d8917d4da19b96937b7f9b12774ea
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://$(SOURCEFORGE_MIRROR)/project/$(PKG)/$(PKG)/$(call SHORT_PKG_VERSION,$(PKG))/$($(PKG)_FILE)
$(PKG)_DEPS     := libiconv gettext mpg123

ifeq ($(MXE_SYSTEM),mingw)
$(PKG)_DEPS     += termcap
endif

define $(PKG)_UPDATE
    $(WGET) -q -O- 'http://sourceforge.net/projects/lame/files/lame/3.100' | \
    $(SED) -n 's,.*lame-\([0-9][0-9.]*\)\.tar.*,\1,p' | \
    $(SORT) -V | \
    tail -1
endef

define $(PKG)_BUILD
    cd '$(1)' && \
        ./configure \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        --prefix='$(HOST_PREFIX)' \
        $(ENABLE_SHARED_OR_STATIC) \
        --disable-frontend \
	--disable-gtktest
    $(MAKE) -C '$(1)' -j '$(JOBS)'
    $(MAKE) -C '$(1)' -j 1 install DESTDIR='$(3)' $(MXE_DISABLE_DOCS)
endef
