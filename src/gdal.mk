# This file is part of MXE.
# See index.html for further information.

PKG             := gdal
$(PKG)_IGNORE   :
$(PKG)_VERSION  := 3.3.3
$(PKG)_CHECKSUM := 82221db588433e1a2f919953835c0317b5122ed8
$(PKG)_SUBDIR   := gdal-$($(PKG)_VERSION)
$(PKG)_FILE     := gdal-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := http://download.osgeo.org/gdal/$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_URL_2    := ftp://ftp.remotesensing.org/gdal/$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_DEPS     := zlib libpng tiff libgeotiff libiconv jpeg jasper giflib expat sqlite curl postgresql gta proj pcre qhull

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://github.com/OSGeo/gdal/tags' | \
    $(SED) -n 's|.*releases/tag/v\([^"]*\).*|\1|p' | $(GREP) -v "RC" | $(SORT) -V | \
    tail -1
endef

define $(PKG)_BUILD
    cd '$(1)' && ./configure \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
	$(CONFIGURE_CPPFLAGS) $(CONFIGURE_LDFLAGS) \
        $(ENABLE_SHARED_OR_STATIC) \
        --prefix='$(HOST_PREFIX)' \
        --with-cpp14 \
        --with-pam \
        --with-libz='$(HOST_PREFIX)' \
        --with-png='$(HOST_PREFIX)' \
        --with-libtiff='$(HOST_PREFIX)' \
        --with-geotiff='$(HOST_PREFIX)' \
        --with-jpeg='$(HOST_PREFIX)' \
        --with-jasper='$(HOST_PREFIX)' \
        --with-gif='$(HOST_PREFIX)' \
        --with-expat='$(HOST_PREFIX)' \
        --with-sqlite3='$(HOST_PREFIX)' \
        --with-curl='$(HOST_BINDIR)/curl-config' \
        --without-geos \
        --with-pg \
        --with-gta='$(HOST_PREFIX)' \
        --with-xml2 \
        --without-odbc \
        --without-xerces \
        --without-grass \
        --without-libgrass \
        --without-spatialite \
        --without-cfitsio \
        --without-pcraster \
        --without-netcdf \
        --without-pcidsk \
        --without-ogdi \
        --without-fme \
        --without-hdf4 \
        --without-hdf5 \
        --without-ecw \
        --without-kakadu \
        --without-mrsid \
        --without-jp2mrsid \
        --without-msg \
        --without-oci \
        --without-mysql \
        --without-ingres \
        --without-dods-root \
        --without-idb \
        --without-epsilon \
        --without-perl \
        --without-python \
        LIBS="-ljpeg `'$(MXE_PKG_CONFIG)' --libs libtiff-4`"
    $(MAKE) -C '$(1)'       -j '$(JOBS)' lib-target
    $(MAKE) -C '$(1)'       -j 1 install-lib
    $(MAKE) -C '$(1)/port'  -j 1 install
    $(MAKE) -C '$(1)/gcore' -j 1 install
    $(MAKE) -C '$(1)/frmts' -j 1 install
    $(MAKE) -C '$(1)/alg'   -j 1 install
    $(MAKE) -C '$(1)/ogr'   -j 1 install OGR_ENABLED=
    $(MAKE) -C '$(1)/apps'  -j 1 install BIN_LIST=
    $(MAKE) -C '$(1)'       -j 1 gdal.pc
    $(INSTALL) -d '$(HOST_LIBDIR)/pkgconfig'
    $(INSTALL) '$(1)/gdal.pc' '$(HOST_LIBDIR)/pkgconfig/'
    if [ $(MXE_NATIVE_BUILD) = no ]; then \
      $(INSTALL) -m755 '$(HOST_BINDIR)/gdal-config' '$(BUILD_TOOLS_PREFIX)/bin/$(MXE_TOOL_PREFIX)gdal-config'; \
    fi
endef
