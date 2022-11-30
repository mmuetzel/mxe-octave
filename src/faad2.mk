# This file is part of MXE.
# See index.html for further information.

PKG             := faad2
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.10.1
$(PKG)_CHECKSUM := 47b9d0ad96e1b402d7ee9d72346b9670b2a81085
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/knik0/$(PKG)/archive/refs/tags/$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     :=

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://github.com/knik0/faad2/tags' | \
    $(SED) -n 's|.*releases/tag/\([^"]*\).*|\1|p' | $(SED) 's|_|.|g' | $(SORT) -V | \
    tail -1
endef

define $(PKG)_BUILD
    cd '$(1)' && '$(1)/bootstrap'
    cd '$(1)' && ./configure \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        --prefix='$(HOST_PREFIX)' \
        $(ENABLE_SHARED_OR_STATIC)
    $(MAKE) -C '$(1)' -j '$(JOBS)' LDFLAGS='-no-undefined' DESTDIR='$(3)'
    $(MAKE) -C '$(1)' -j 1 install LDFLAGS='-no-undefined' $(MXE_DISABLE_DOCS) $(MXE_DISABLE_PROGS) DESTDIR='$(3)'
endef

