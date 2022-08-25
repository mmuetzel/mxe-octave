# This file is part of MXE.
# See index.html for further information.

PKG             := sdl2_mixer
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.6.2
$(PKG)_CHECKSUM := 036fc7839a6b8dc1af3dbfed4e2531224bbacdd7
$(PKG)_SUBDIR   := SDL2_mixer-$($(PKG)_VERSION)
$(PKG)_FILE     := SDL2_mixer-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/libsdl-org/SDL_mixer/releases/download/release-$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_DEPS     := sdl2 mpg123 ogg opusfile vorbis

define $(PKG)_UPDATE
    $(WGET) -q -O- 'http://hg.libsdl.org/SDL_mixer/tags' | \
    $(SED) -n 's,.*release-\([0-9][^<"]*\).*,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
    $(SED) -i 's,^\(Requires:.*\),\1 opusfile vorbisfile,' '$(1)/SDL2_mixer.pc.in'
    echo \
        'Libs.private:' \
        "`$(TARGET)-pkg-config libmodplug libmpg123 --libs`" \
        "`$(PREFIX)/$(TARGET)/bin/smpeg2-config --libs`" \
        >> '$(1)/SDL2_mixer.pc.in'
    $(SED) -i 's,for path in /usr/local; do,for path in; do,' '$(1)/configure'
    cd '$(1)' && ./configure \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        $(ENABLE_SHARED_OR_STATIC) \
        --prefix='$(HOST_PREFIX)' \
        --with-sdl-prefix='$(HOST_PREFIX)' \
        --disable-sdltest \
        --disable-music-mod \
        --enable-music-mod-modplug \
        --enable-music-ogg \
        --disable-music-ogg-shared \
        --disable-music-flac \
        --disable-music-flac-shared \
        --enable-music-mp3 \
        --disable-smpegtest \
        SMPEG_CONFIG='$(HOST_BINDIR)/smpeg2-config' \
        WINDRES='$(TARGET)-windres' \
        LIBS="`$(TARGET)-pkg-config libmodplug libmpg123 opusfile vorbisfile --libs-only-l`"

    $(MAKE) -C '$(1)' -j '$(JOBS)' install $(MXE_DISABLE_PROGS) $(MXE_DISABLE_DOCS) DESTDIR='$(3)'
endef
