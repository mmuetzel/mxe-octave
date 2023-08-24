# This file is part of MXE.
# See index.html for further information.

PKG             := dbus
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.15.8
$(PKG)_CHECKSUM := 73538c86a0b3da9a1c054383543da652eeea122e
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := http://$(PKG).freedesktop.org/releases/$(PKG)/$($(PKG)_FILE)
$(PKG)_DEPS     := expat

$(PKG)_DISABLE_PROGS :=
ifeq ($(MXE_SYSTEM),mingw)
  $(PKG)_DISABLE_PROGS := $(MXE_DISABLE_PROGS)
endif

define $(PKG)_UPDATE
    $(WGET) -q -O- https://gitlab.freedesktop.org/dbus/dbus/-/tags | \
    $(SED) -n 's|.*/tags/dbus-\([^"]*\).*|\1|p' | grep -v 'rc' | $(SORT) -V | \
    tail -1
endef

$(PKG)_CMAKE_FLAGS :=

define $(PKG)_BUILD
    cd '$(1)' && cmake \
        $($(PKG)_CMAKE_FLAGS) \
        -DDBUS_BUILD_TESTS=OFF \
        -DDBUS_DISABLE_ASSERT=ON \
        -DDBUS_ENABLE_VERBOSE_MODE=OFF \
        -DDBUS_ENABLE_DOXYGEN_DOCS=OFF \
        -DDBUS_ENABLE_QTHELP_DOCS=OFF \
        -DDBUS_ENABLE_XML_DOCS=OFF \
        -DDBUS_GCOV_ENABLED=OFF \
        -DDBUS_ENABLE_PKGCONFIG=ON \
        $(CMAKE_CCACHE_FLAGS) \
        $(CMAKE_BUILD_SHARED_OR_STATIC) \
        -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)' \
        .

    $(MAKE) -C '$(1)' -j '$(JOBS)' VERBOSE=1
    $(MAKE) -C '$(1)' -j '1' VERBOSE=1 DESTDIR='$(3)' install
    rm '$(3)$(HOST_BINDIR)/'*.exe
    rm -rf '$(3)$(HOST_LIBDIR)/cmake/DBus1'
endef
