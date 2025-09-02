# This file is part of MXE.
# See index.html for further information.

PKG             := dbus
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.16.2
$(PKG)_CHECKSUM := f44e9a36af548909e46aec8b29b965aeabc3bfbd
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := http://$(PKG).freedesktop.org/releases/$(PKG)/$($(PKG)_FILE)
$(PKG)_DEPS     := expat

$(PKG)_DISABLE_PROGS :=
ifeq ($(MXE_SYSTEM),mingw)
  $(PKG)_DISABLE_PROGS := $(MXE_DISABLE_PROGS)
endif

$(PKG)_CMAKE_FLAGS :=

define $(PKG)_UPDATE
    $(WGET) -q -O- https://gitlab.freedesktop.org/dbus/dbus/-/tags | \
    $(SED) -n 's|.*/tags/dbus-\([^"]*\).*|\1|p' | grep -v 'rc' | $(SORT) -V | \
    tail -1
endef

define $(PKG)_BUILD
    cd '$(1)' && cmake \
        $($(PKG)_CMAKE_FLAGS) \
        -DDBUS_ENABLE_PKGCONFIG=yes \
        -DDBUS_BUILD_TESTS=no \
        -DDBUS_ENABLE_VERBOSE_MODE=no \
        -DDBUS_ENABLE_DOXYGEN_DOCS=no \
        -DDBUS_ENABLE_XML_DOCS=no \
        -DDBUS_ENABLE_QTHELP_DOCS=no \
        -DDBUS_ENABLE_SYSTEMD=no \
        -DDBUS_DISABLE_ASSERT=yes \
        -DDBUS_SERVICE=no \
        $(CMAKE_CCACHE_FLAGS) \
        $(CMAKE_BUILD_SHARED_OR_STATIC) \
        -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)' \
        .

    $(MAKE) -C '$(1)' -j '$(JOBS)' VERBOSE=1
    $(MAKE) -C '$(1)' -j '1' VERBOSE=1 DESTDIR='$(3)' install
endef
