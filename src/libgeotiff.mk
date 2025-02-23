# This file is part of MXE.
# See index.html for further information.

PKG             := libgeotiff
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.7.3
$(PKG)_CHECKSUM := 8bb14997d43ff78f5a39b803a0e3aa7425e71b8e
$(PKG)_SUBDIR   := libgeotiff-$($(PKG)_VERSION)
$(PKG)_FILE     := libgeotiff-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := http://download.osgeo.org/geotiff/libgeotiff/$($(PKG)_FILE)
$(PKG)_URL_2    := ftp://ftp.remotesensing.org/geotiff/libgeotiff/$($(PKG)_FILE)
$(PKG)_DEPS     := zlib jpeg tiff proj

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,OSGeo,libgeotiff,)
endef

define $(PKG)_BUILD
    $(SED) -i 's,/usr/local,@prefix@,' '$(1)/bin/Makefile.in'
    touch '$(1)/configure'
    cd '$(1)' && autoreconf -fi
    cd '$(1)' && ./configure \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        $(ENABLE_SHARED_OR_STATIC) \
        --prefix='$(HOST_PREFIX)' \
        --with-zlib=$(HOST_PREFIX) \
        --with-jpeg=$(HOST_PREFIX) \
        --with-libtiff=$(HOST_PREFIX) \
        --with-proj=$(HOST_PREFIX) 

    $(MAKE) -C '$(1)' -j $(JOBS) 
    $(MAKE) -C '$(1)' -j 1 install
endef
