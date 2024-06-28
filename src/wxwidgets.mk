# This file is part of MXE.
# See index.html for further information.

PKG             := wxwidgets
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.2.5
$(PKG)_CHECKSUM := 4ffee63f4109cafe98b82b44adec6ed9a4e4ad1e
$(PKG)_SUBDIR   := wxWidgets-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_SUBDIR).tar.bz2
$(PKG)_URL      := https://github.com/wxWidgets/wxWidgets/releases/download/v$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_DEPS     := libiconv libpng jpeg tiff sdl2 zlib expat

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,wxWidgets,wxWidgets,v)
endef

define $(PKG)_BUILD

    # build the wxWidgets variant without unicode support
    cd '$(1)' && ./configure \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
	$(if $(BUILD_SHARED),,--disable-shared) \
        --prefix='$(HOST_PREFIX)' \
        --enable-compat28 \
        --enable-gui \
        --disable-stl \
        --enable-threads \
        --enable-unicode \
        --disable-universal \
        --with-themes=all \
        --with-msw \
        --with-opengl \
        --with-libpng=sys \
        --with-libjpeg=sys \
        --with-libtiff=sys \
        --with-regex=yes \
        --with-zlib=sys \
        --with-expat=sys \
        --with-sdl \
        --without-gtk \
        --without-macosx-sdk \
        --without-libxpm \
        --without-libmspack \
        --without-gnomevfs \
        --without-dmalloc \
        LIBS=" `'$(MXE_PKG_CONFIG)' --libs-only-l libtiff-4`" \
        CXXFLAGS='-std=gnu++11' \
        CXXCPP='$(MXE_CXX) -E -std=gnu++11'

    $(MAKE) -C '$(1)' -j '$(JOBS)' $(MXE_DISABLE_DOCS) $(MXE_DISABLE_PROGS)

    $(MAKE) -C '$(1)' -j 1 install $(MXE_DISABLE_DOCS) $(MXE_DISABLE_PROGS)  __install_wxrc___depname=

    $(INSTALL) -m755 '$(HOST_BINDIR)/wx-config' '$(BUILD_TOOLS_PREFIX)/bin/$(MXE_TOOL_PREFIX)wx-config'

endef
