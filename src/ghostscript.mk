# This file is part of MXE.
# See index.html for further information.

PKG             := ghostscript
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 10.07.0
$(PKG)_NODOTVER := $(subst .,,$($(PKG)_VERSION))
$(PKG)_CHECKSUM := 913f60d446d8c9ed53230c5a5b52d163a3b31462
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$($(PKG)_NODOTVER)/$($(PKG)_FILE)
$(PKG)_DEPS     := dbus fontconfig freetype jpeg libiconv libidn libpaper libpng openjpeg tiff zlib

ifeq ($(MXE_WINDOWS_BUILD),no)
  ifeq ($(USE_SYSTEM_X11_LIBS),no)
    $(PKG)_DEPS += x11 xext
  endif
endif

ifeq ($(MXE_NATIVE_MINGW_BUILD),yes)
    $(PKG)_DEPS += lcms
endif

ifeq ($(MXE_NATIVE_BUILD),yes)
    $(PKG)_CONFIGURE_FLAGS=$(CONFIGURE_LDFLAGS) $(CONFIGURE_CPPFLAGS) --with-libiconv=gnu
else
    $(PKG)_CONFIGURE_FLAGS="CFLAGSAUX=-std=gnu17"
endif

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://api.github.com/repos/ArtifexSoftware/ghostpdl-downloads/releases' | \
    $(SED) -n 's,.*"ghostscript-\([0-9\.]*\)\.tar.xz".*,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
    cd '$(1)' && rm -rf freetype jpeg lcm2mt libpng openjpeg tiff
    mkdir '$(1)/.build'

    cd '$(1)/.build' && $(1)/configure \
        CC='$(MXE_CC) -std=gnu17' \
        CFLAGS='$(CFLAGS) -Wno-int-conversion' \
        CPPFLAGS='$(CPPFLAGS) -DHAVE_SYS_TIMES_H=0' \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        $($(PKG)_CONFIGURE_FLAGS) \
        --prefix='$(HOST_PREFIX)' \
        --with-libiconv=gnu \
        --without-local-zlib \
        --with-system-libtiff \
        --without-tesseract 

    $(MAKE) -C '$(1)/.build' -j '$(JOBS)' $(if $(BUILD_STATIC),libgs,so)
    $(MAKE) -C '$(1)/.build' prefix='$(HOST_PREFIX)' install

    if [ "x$(ENABLE_DEP_DOCS)" == "xno" ]; then \
      rm -f $(HOST_PREFIX)/share/doc/ghostscript/$($(PKG)_VERSION)/*.htm; \
    fi
endef

