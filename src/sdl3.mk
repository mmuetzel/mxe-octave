# This file is part of MXE.
# See index.html for further information.

PKG             := sdl3
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.2.20
$(PKG)_CHECKSUM := 388e3051f5b40068fff5491e1797968a314d8ba7
$(PKG)_SUBDIR   := SDL3-$($(PKG)_VERSION)
$(PKG)_FILE     := SDL3-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := http://www.libsdl.org/release/$($(PKG)_FILE)
$(PKG)_DEPS     := libiconv libsamplerate

$(PKG)_CMAKE_FLAGS :=

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://hg.libsdl.org/SDL/tags' | \
    $(SED) -n 's,.*tag/release-\(3[^"]*\).*,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
    cd '$(1)' && cmake \
        $($(PKG)_CMAKE_FLAGS) \
        -DBUILD_TESTING=no \
        $(CMAKE_CCACHE_FLAGS) \
        $(CMAKE_BUILD_SHARED_OR_STATIC) \
        -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)' \
        .

    $(MAKE) -C '$(1)' -j '$(JOBS)' VERBOSE=1
    $(MAKE) -C '$(1)' -j '1' VERBOSE=1 DESTDIR='$(3)' install
endef
