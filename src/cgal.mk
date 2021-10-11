# This file is part of MXE.
# See index.html for further information.

PKG             := cgal
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.11
$(PKG)_CHECKSUM := 9a7963bc59997459bb456a69b2f286eb1667f28c
$(PKG)_SUBDIR   := CGAL-$($(PKG)_VERSION)
$(PKG)_FILE     := CGAL-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := https://github.com/CGAL/cgal/releases/download/releases/$($(PKG)_SUBDIR)/$($(PKG)_FILE)
$(PKG)_DEPS     := boost gmp mpfr qt

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://github.com/CGAL/cgal/tags' | \
    $(SED) -n 's|.*releases/tag/v\([^"]*\).*|\1|p' | $(SORT) -V | \
    tail -1
endef

define $(PKG)_BUILD
    cd '$(1)' && cmake \
        -DCGAL_INSTALL_CMAKE_DIR:STRING="lib/CGAL" \
        -DCGAL_INSTALL_INC_DIR:STRING="include" \
        -DCGAL_INSTALL_DOC_DIR:STRING="share/doc/CGAL-3.9" \
        -DCGAL_INSTALL_BIN_DIR:STRING="bin" \
        -DBOOST_LIB_DIAGNOSTIC_DEFINITIONS:STRING="-DBOOST_LIB_DIAGNOSTIC" \
        -DWITH_CGAL_Qt3:BOOL="0" \
        $(CMAKE_CCACHE_FLAGS) \
        $(CMAKE_BUILD_SHARED_OR_STATIC) \
        -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)' \
        -DBOOST_COMPILER=_win32 \
        -DBOOST_THREAD_USE_LIB=1 \
        -DBOOST_USE_STATIC_LIBS=1 \
        -DBUILD_SHARED_LIBS=0 \
        -C TryRunResults.cgal.cmake .
    $(MAKE) -C '$(1)' -j $(JOBS)

    cd '$(1)/examples/AABB_tree' && cmake \
        -DBOOST_LIB_DIAGNOSTIC_DEFINITIONS:STRING="-DBOOST_LIB_DIAGNOSTIC" \
        -DWITH_CGAL_Qt3:BOOL="0" \
        $(CMAKE_CCACHE_FLAGS) \
        $(CMAKE_BUILD_SHARED_OR_STATIC) \
        -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)' \
        -DBOOST_COMPILER=_win32 \
        -DBOOST_THREAD_USE_LIB=1 \
        -DBOOST_USE_STATIC_LIBS=1 \
        -DBUILD_SHARED_LIBS=0 \
        -DCGAL_DIR:STRING="../.." .

    $(MAKE) -C '$(1)/examples/AABB_tree' -j $(JOBS)
    $(MAKE) -C '$(1)' -j $(JOBS) install
    $(INSTALL) '$(1)/examples/AABB_tree/AABB_polyhedron_edge_example.exe' '$(HOST_BINDIR)/test-cgal.exe'
endef
