# This file is part of MXE.
# See index.html for further information.

PKG             := theora
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.2.0
$(PKG)_CHECKSUM := 4ff09d71466d5869e5750ff84b59952c7335e693
$(PKG)_SUBDIR   := libtheora-$($(PKG)_VERSION)
$(PKG)_FILE     := libtheora-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := http://downloads.xiph.org/releases/theora/$($(PKG)_FILE)
$(PKG)_DEPS     := ogg vorbis

define $(PKG)_UPDATE
    $(WGET) -q -O- 'http://www.xiph.org/downloads/' | \
    $(SED) -n 's,.*libtheora-\([0-9][^>]*\)\.tar.*,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
   if [ "$(MXE_SYSTEM)" == "mingw" ]; then \
       $(SED) -i 's,EXPORTS,,' '$(1)/win32/xmingw32/libtheoradec-all.def'; \
       $(SED) -i 's,EXPORTS,,' '$(1)/win32/xmingw32/libtheoraenc-all.def'; \
   fi

    cd '$(1)' && HAVE_DOXYGEN=false ./configure \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        $(ENABLE_SHARED_OR_STATIC) \
        --prefix='$(HOST_PREFIX)' \
        --disable-spec --datadir='$(1)'
    $(MAKE) -C '$(1)' -j '$(JOBS)' install $(MXE_DISABLE_PROGS) $(MXE_DISABLE_DOCS)
endef
