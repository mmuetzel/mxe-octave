# This file is part of MXE.
# See index.html for further information.

PKG             := gdal
$(PKG)_IGNORE   :
$(PKG)_VERSION  := 3.7.2
$(PKG)_CHECKSUM := 1b26dab7cc02af2597be71b7b2782ce94505772c
$(PKG)_SUBDIR   := gdal-$($(PKG)_VERSION)
$(PKG)_FILE     := gdal-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/OSGeo/gdal/archive/refs/tags/v$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     := zlib libpng tiff libgeotiff libiconv jpeg jasper giflib expat sqlite curl postgresql gta proj pcre2 qhull

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,OSGeo,gdal,v)
endef

define $(PKG)_BUILD
    cd '$(1)' && cmake \
        $($(PKG)_CMAKE_FLAGS) \
        -DBUILD_TESTING=no \
        $(CMAKE_CCACHE_FLAGS) \
        $(CMAKE_BUILD_SHARED_OR_STATIC) \
        -DIconv_IS_BUILT_IN=OFF \
        -DBUILD_APPS=OFF \
        -DGDAL_USE_ARMADILLO=OFF \
        -DGDAL_USE_ARROW=OFF \
        -DGDAL_USE_GDAL_BASISU=OFF \
        -DGDAL_USE_BLOSC=OFF \
        -DGDAL_USE_BRUNSLI=OFF \
        -DGDAL_USE_CFITSIO=OFF \
        -DGDAL_USE_CRNLIB=OFF \
        -DGDAL_USE_CURL=ON \
        -DGDAL_USE_CRYPTOPP=OFF \
        -DGDAL_USE_DEFLATE=OFF \
        -DGDAL_USE_ECW=OFF \
        -DGDAL_USE_EXPAT=ON \
        -DGDAL_USE_FILEGDB=OFF \
        -DGDAL_USE_FREEXL=OFF \
        -DGDAL_USE_FYBA=OFF \
        -DGDAL_USE_GEOTIFF=ON \
        -DGDAL_USE_GEOS=OFF \
        -DGDAL_USE_GIF=ON \
        -DGDAL_USE_GTA=ON \
        -DGDAL_USE_HEIF=OFF \
        -DGDAL_USE_HDF4=OFF \
        -DGDAL_USE_HDF5=OFF \
        -DGDAL_USE_ICONV=ON \
        -DGDAL_USE_IDB=OFF \
        -DGDAL_USE_JPEG=ON \
        -DGDAL_USE_JSONC=OFF \
        -DGDAL_USE_JXL=OFF \
        -DGDAL_USE_KDU=OFF \
        -DGDAL_USE_KEA=OFF \
        -DGDAL_USE_LERC=OFF \
        -DGDAL_USE_LIBKML=OFF \
        -DGDAL_USE_LIBLZMA=ON \
        -DGDAL_USE_LIBXML2=ON \
        -DGDAL_USE_LURATECH=OFF \
        -DGDAL_USE_LZ4=OFF \
        -DGDAL_USE_MONGOCXX=OFF \
        -DGDAL_USE_MRSID=OFF \
        -DGDAL_USE_MSSQL_NCLI=OFF \
        -DGDAL_USE_MSSQL_ODBC=OFF \
        -DGDAL_USE_MYSQL=OFF \
        -DGDAL_USE_NETCDF=OFF \
        -DGDAL_USE_ODBC=OFF \
        -DGDAL_USE_ODBCCPP=OFF \
        -DGDAL_USE_OGDI=OFF \
        -DGDAL_USE_OPENCAD=OFF \
        -DGDAL_USE_OPENCL=OFF \
        -DGDAL_USE_OPENEXR=OFF \
        -DGDAL_USE_OPENJPEG=OFF \
        -DGDAL_USE_OPENSSL=OFF \
        -DGDAL_USE_ORACLE=OFF \
        -DGDAL_USE_PARQUET=OFF \
        -DGDAL_USE_PCRE2=ON \
        -DGDAL_USE_PDFIUM=OFF \
        -DGDAL_USE_PNG=ON \
        -DGDAL_USE_POPPLER=OFF \
        -DGDAL_USE_POSTGRESQL=ON \
        -DGDAL_USE_QB3=OFF \
        -DGDAL_USE_QHULL=ON \
        -DGDAL_USE_RASTERLITE2=OFF \
        -DGDAL_USE_RDB=OFF \
        -DGDAL_USE_SPATIALITE=OFF \
        -DGDAL_USE_SQLITE3=ON \
        -DGDAL_USE_SFCGAL=OFF \
        -DGDAL_USE_TEIGHA=OFF \
        -DGDAL_USE_TIFF=ON \
        -DGDAL_USE_TILEDB=OFF \
        -DGDAL_USE_WEBP=OFF \
        -DGDAL_USE_XERCESC=OFF \
        -DGDAL_USE_ZLIB=ON \
        -DGDAL_USE_ZSTD=OFF \
        -DBUILD_PYTHON_BINDINGS=OFF \
        -DBUILD_JAVA_BINDINGS=OFF \
        -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)' \
        .

    $(MAKE) -C '$(1)' -j '$(JOBS)' VERBOSE=1
    $(MAKE) -C '$(1)' -j '1' VERBOSE=1 DESTDIR='$(3)' install
endef
