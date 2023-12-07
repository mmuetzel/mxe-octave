# This file is part of MXE.
# See index.html for further information.

PKG             := sdl2_image
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.8.0
$(PKG)_CHECKSUM := a6b21fb9f504a709cd43f998694f68efbd2974bf
$(PKG)_SUBDIR   := SDL2_image-$($(PKG)_VERSION)
$(PKG)_FILE     := SDL2_image-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/libsdl-org/SDL_image/releases/download/release-$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_DEPS     := sdl2 jpeg libpng libwebp tiff

define $(PKG)_UPDATE
    $(WGET) -q -O- 'http://hg.libsdl.org/SDL_image/tags' | \
    $(SED) -n 's,.*release-\([0-9][^<"]*\).*,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
    $(SED) -i 's,^\(Requires:.*\),\1\nRequires.private: libtiff-4 libpng libwebp,' '$(1)/SDL2_image.pc.in'
    cd '$(1)' && ./configure \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        $(ENABLE_SHARED_OR_STATIC) \
        --prefix='$(HOST_PREFIX)' \
        --with-sdl-prefix='$(HOST_PREFIX)' \
        --disable-sdltest \
        --disable-jpg-shared \
        --disable-png-shared \
        --disable-tif-shared \
        --disable-webp-shared
    $(MAKE) -C '$(1)' -j '$(JOBS)' install $(MXE_DISABLE_PROGS) $(MXE_DISABLE_DOCS) DESTDIR='$(3)'
endef
