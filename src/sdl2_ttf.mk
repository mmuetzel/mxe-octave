# This file is part of MXE.
# See index.html for further information.

PKG             := sdl2_ttf
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.0.15
$(PKG)_CHECKSUM := 1453c5f72f986024c5271c76d74cc232aa57dd79
$(PKG)_SUBDIR   := SDL2_ttf-$($(PKG)_VERSION)
$(PKG)_FILE     := SDL2_ttf-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://www.libsdl.org/projects/SDL_ttf/release/$($(PKG)_FILE)
$(PKG)_DEPS     := sdl2 freetype

define $(PKG)_UPDATE
    $(WGET) -q -O- 'http://hg.libsdl.org/SDL_ttf/tags' | \
    $(SED) -n 's,.*release-\([0-9][^<"]*\).*,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
    echo 'Requires.private: freetype2' >> '$(1)/SDL2_ttf.pc.in'
    cd '$(1)' && ./configure \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        $(ENABLE_SHARED_OR_STATIC) \
        --prefix='$(HOST_PREFIX)' \
        --with-sdl-prefix='$(HOST_PREFIX)' \
        --disable-sdltest \
        --with-freetype-prefix='$(PREFIX)/$(TARGET)'
    $(MAKE) -C '$(1)' -j '$(JOBS)' install $(MXE_DISABLE_PROGS) $(MXE_DISABLE_DOCS) DESTDIR='$(3)'
endef
