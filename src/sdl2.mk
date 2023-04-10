# This file is part of MXE.
# See index.html for further information.

PKG             := sdl2
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.26.5
$(PKG)_CHECKSUM := ca5d89edc537fd819eddab1f1a86f61e45fcb68b
$(PKG)_SUBDIR   := SDL2-$($(PKG)_VERSION)
$(PKG)_FILE     := SDL2-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := http://www.libsdl.org/release/$($(PKG)_FILE)
$(PKG)_DEPS     := libiconv libsamplerate

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://hg.libsdl.org/SDL/tags' | \
    $(SED) -n 's,.*tag/release-\([0-9][^"]*\).*,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
    cd '$(1)' && aclocal -I acinclude && autoconf && $(SHELL) ./configure \
        $(CONFIGURE_CPPFLAGS) $(CONFIGURE_LDFLAGS) \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        $(ENABLE_SHARED_OR_STATIC) \
        --prefix='$(HOST_PREFIX)' \
        --enable-libsamplerate \
        --enable-libsamplerate-shared=$(if $(BUILD_SHARED),yes,no)

    $(SED) -i 's,defined(__MINGW64_VERSION_MAJOR),defined(__MINGW64_VERSION_MAJOR) \&\& defined(_WIN64),' '$(1)/include/SDL_cpuinfo.h'
    $(SED) -i 's,-XCClinker,,' '$(1)/sdl2.pc'
    $(SED) -i 's,-XCClinker,,' '$(1)/sdl2-config'
    $(MAKE) -C '$(1)' -j '$(JOBS)' SHELL=$(SHELL)
    $(MAKE) -C '$(1)' -j 1 install SHELL=$(SHELL)
    if [ "$(MXE_NATIVE_BUILD)" == "no" ]; then \
      $(LN_SF) -sf '$(HOST_BINDIR)/sdl2-config' '$(BUILD_TOOLS_PREFIX)/bin/$(MXE_TOOL_REFIX)sdl2-config'; \
    fi
endef
