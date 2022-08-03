# This file is part of MXE.
# See index.html for further information.

PKG             := mpg123
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.30.2
$(PKG)_CHECKSUM := 3838b289585a2c02bac3aa5b3963663c3e26fa24
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.bz2
$(PKG)_URL      := https://$(SOURCEFORGE_MIRROR)/project/mpg123/$(PKG)/$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_DEPS     := sdl2 

$(PKG)_CONFIGURE_OPTIONS :=
ifeq ($(MXE_WINDOWS_BUILD),yes)
    $(PKG)_CONFIGURE_OPTIONS += \
        --with-default-audio=win32 \
        --with-audio=win32,sdl,dummy \
        --enable-modules=no
endif

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://sourceforge.net/projects/mpg123/files/mpg123/' | \
    $(SED) -n 's,.*/projects/.*/\([0-9][^"]*\)/".*,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
    cd '$(1)' && ./configure \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        $(ENABLE_SHARED_OR_STATIC) \
        --prefix='$(HOST_PREFIX)' \
	$($(PKG)_CONFIGURE_OPTIONS)

    $(MAKE) -C '$(1)' -j '$(JOBS)'
    $(MAKE) -C '$(1)' -j 1 install
endef
