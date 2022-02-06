# This file is part of MXE.
# See index.html for further information.

PKG             := expat
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.4.4
$(PKG)_CHECKSUM := 5886188fb74f888205920a33dbc6defaf5f48479
$(PKG)_SUBDIR   := expat-$($(PKG)_VERSION)
$(PKG)_FILE     := expat-$($(PKG)_VERSION).tar.bz2
$(PKG)_URL      := http://$(SOURCEFORGE_MIRROR)/project/expat/expat/$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_DEPS     :=

define $(PKG)_UPDATE
    $(WGET) -q -O- 'http://sourceforge.net/projects/expat/files/expat/' | \
    $(SED) -n 's,.*tr title="\([0-9][^"]*\)".*,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
    cd '$(1)' && ./configure \
        $(CONFIGURE_CPPFLAGS) $(CONFIGURE_LDFLAGS) \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        $(ENABLE_SHARED_OR_STATIC) \
	--without-docbook \
        --prefix='$(HOST_PREFIX)' && $(CONFIGURE_POST_HOOK)
    $(MAKE) -C '$(1)' -j '$(JOBS)' install $(MXE_DISABLE_PROGS) DESTDIR='$(3)'
endef
