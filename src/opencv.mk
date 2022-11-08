# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := opencv
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.6.0
$(PKG)_CHECKSUM := 34394c7e2fc152eee1ce73e326bc19a99879c77c
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_SUBDIR).tar.gz
$(PKG)_URL      := https://github.com/opencv/$(PKG)/archive/$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     := eigen ffmpeg jasper jpeg libpng \
                   openblas openexr tiff xz zlib

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,opencv,opencv,)
endef

# -DCMAKE_CXX_STANDARD=98 required for non-posix gcc7 build

define $(PKG)_BUILD
    # build
    mkdir '$(1)/build'
    cd '$(1)/build' && cmake ..  \
        $(CMAKE_CCACHE_FLAGS) \
        $(CMAKE_BUILD_SHARED_OR_STATIC) \
        -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)' \
        --debug-output \
        -DBUILD_opencv_dnn=OFF \
        -DBUILD_opencv_java=OFF \
        -DBUILD_opencv_python=OFF \
        -DWITH_QT=OFF \
        -DWITH_OPENGL=ON \
        -DWITH_GSTREAMER=OFF \
        -DWITH_GTK=OFF \
        -DWITH_VIDEOINPUT=ON \
        -DWITH_XINE=OFF \
        -DWITH_PYTHON=OFF \
        -DWITH_PROTOBUF=OFF \
        -DWITH_CUDA=OFF \
        -DBUILD_opencv_apps=OFF \
        -DBUILD_DOCS=OFF \
        -DBUILD_EXAMPLES=OFF \
        -DBUILD_PACKAGE=OFF \
        -DBUILD_PERF_TESTS=OFF \
        -DBUILD_TESTS=OFF \
        -DBUILD_WITH_DEBUG_INFO=OFF \
        -DBUILD_FAT_JAVA_LIB=OFF \
        -DBUILD_ZLIB=OFF \
        -DBUILD_TIFF=OFF \
        -DBUILD_JASPER=OFF \
        -DBUILD_JPEG=OFF \
        -DBUILD_WEBP=ON \
        -DBUILD_PROTOBUF=OFF \
        -DPROTOBUF_UPDATE_FILES=ON \
        -DBUILD_PNG=OFF \
        -DBUILD_OPENEXR=OFF \
        -DCMAKE_VERBOSE=ON \
        -DCMAKE_CXX_STANDARD=11 \
        -DCMAKE_CXX_FLAGS='-D_WIN32_WINNT=0x0500'

    # install
    $(MAKE) -C '$(1)/build' -j '$(JOBS)' VERBOSE=1
    $(MAKE) -C '$(1)/build' -j 1 install VERBOSE=1

endef
