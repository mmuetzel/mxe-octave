# This file is part of MXE.
# See index.html for further information.

PKG             := sdl2_net
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.0.1
$(PKG)_CHECKSUM := 99c17ee2ecf32c8a136163bbaa8f018f7a3e31e9
$(PKG)_SUBDIR   := SDL2_net-$($(PKG)_VERSION)
$(PKG)_FILE     := SDL2_net-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://www.libsdl.org/projects/SDL_net/release/$($(PKG)_FILE)
$(PKG)_DEPS     := sdl2

define $(PKG)_UPDATE
    $(WGET) -q -O- 'http://hg.libsdl.org/SDL_net/tags' | \
    $(SED) -n 's,.*release-\([0-9][^<"]*\).*,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
    cd '$(1)' && ./configure \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        $(ENABLE_SHARED_OR_STATIC) \
        --prefix='$(HOST_PREFIX)' \
        --with-sdl-prefix='$(HOST_PREFIX)' \
        --disable-sdltest \
        --disable-gui
    $(MAKE) -C '$(1)' -j '$(JOBS)' install $(MXE_DISABLE_PROGS) $(MXE_DISABLE_DOCS) DESTDIR='$(3)'
endef
