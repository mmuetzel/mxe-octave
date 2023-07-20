# This file is part of MXE.
# See index.html for further information.

PKG             := ffmpeg
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.2.9
$(PKG)_CHECKSUM := 7bfec63cfe78f50775f0931396552b7e898dfff7
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.bz2
$(PKG)_URL      := http://www.ffmpeg.org/releases/$($(PKG)_FILE)
$(PKG)_URL_2    := http://launchpad.net/ffmpeg/main/$($(PKG)_VERSION)/+download/$($(PKG)_FILE)
$(PKG)_DEPS     := bzip2 gnutls lame libvpx opencore-amr sdl2 speex theora vorbis x264 xvidcore zlib

$(PKG)_CONFIG_OPTS :=

define $(PKG)_UPDATE
    $(WGET) -q -O- 'http://www.ffmpeg.org/download.html' | \
    $(SED) -n 's,.*ffmpeg-\([0-9][^>]*\)\.tar.*,\1,p' | \
    $(GREP) "^4.2" | \
    head -1
endef

ifeq ($(TARGET),i686-w64-mingw32)
  $(PKG)_CONFIG_OPTS += --disable-optimizations
endif

# disable asm usage when native linux with system gcc
ifeq ($(MXE_SYSTEM)$(USE_SYSTEM_GCC),gnu-linuxyes)
  $(PKG)_CONFIG_OPTS += --disable-asm
endif

ifeq ($(MXE_NATIVE_BUILD),no)

define $(PKG)_BUILD
    '$(SED)' -i "s^[-]lvpx^`'$(MXE_PKG_CONFIG)' --libs-only-l vpx`^g;" $(1)/configure
    cd '$(1)' && ./configure \
        --cross-prefix='$(MXE_TOOL_PREFIX)' \
        --enable-cross-compile  \
        --target-os=mingw32 \
        --arch=$(firstword $(subst -, ,$(TARGET))) \
        --prefix='$(HOST_PREFIX)' \
        $(ENABLE_SHARED_OR_STATIC) \
        --yasmexe='$(BUILD_TOOLS_PREFIX)/bin/yasm' \
        --extra-libs='-mconsole' \
        --disable-debug \
        --disable-doc \
        --enable-avresample \
        --enable-gpl \
        --enable-version3 \
        --disable-pthreads \
        --enable-w32threads \
        --enable-avisynth \
        --enable-gnutls \
        --enable-libspeex \
        --enable-libtheora \
        --enable-libvorbis \
        --enable-libmp3lame \
        --enable-libxvid \
        --enable-libopencore-amrnb \
        --enable-libopencore-amrwb \
        --enable-libx264 \
        --enable-libvpx \
	$($(PKG)_CONFIG_OPTS)
    $(MAKE) -C '$(1)' -j '$(JOBS)' V=1
    $(MAKE) -C '$(1)' -j 1 install DESTDIR='$(3)'
    rm -rf "$(3)$(HOST_PREFIX)/share/ffmpeg"
endef
else
define $(PKG)_BUILD
    '$(SED)' -i "s^[-]lvpx^`'$(MXE_PKG_CONFIG)' --libs-only-l vpx`^g;" $(1)/configure
    cd '$(1)' && CPPFLAGS=-I$(HOST_INCDIR) LDFLAGS=-L$(HOST_LIBDIR) ./configure \
        --prefix='$(HOST_PREFIX)' \
        $(ENABLE_SHARED_OR_STATIC) \
        --disable-debug \
        --disable-doc \
	--disable-programs \
        --enable-gpl \
        --enable-version3 \
        --disable-nonfree \
        --enable-postproc \
        --enable-avisynth \
        --enable-libspeex \
        --enable-libtheora \
        --enable-libvorbis \
        --enable-libmp3lame \
        --enable-libxvid \
        --enable-libopencore-amrnb \
        --enable-libopencore-amrwb \
        --enable-libx264 \
        --enable-libvpx \
	$($(PKG)_CONFIG_OPTS)
    $(MAKE) -C '$(1)' -j '$(JOBS)'
    $(MAKE) -C '$(1)' -j 1 install DESTDIR='$(3)'
    rm -rf "$(3)$(HOST_PREFIX)/share/ffmpeg"
endef

endif
