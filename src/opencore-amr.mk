# This file is part of MXE.
# See index.html for further information.

PKG             := opencore-amr
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.1.6
$(PKG)_CHECKSUM := 3c2c618a5a38757a530034f80aa5356789589bcc
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := http://$(SOURCEFORGE_MIRROR)/project/$(PKG)/$(PKG)/$($(PKG)_FILE)
$(PKG)_DEPS     :=

define $(PKG)_UPDATE
    $(WGET) -q -O- 'http://sourceforge.net/projects/opencore-amr/files/opencore-amr/' | \
    $(SED) -n 's,.*<tr title="opencore-amr-\([0-9\.]*\)\.tar.gz".*,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
    cd '$(1)' && ./configure \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        --prefix='$(HOST_PREFIX)' \
        $(ENABLE_SHARED_OR_STATIC)
    $(MAKE) -C '$(1)' -j '$(JOBS)'
    $(MAKE) -C '$(1)' -j 1 install
endef
