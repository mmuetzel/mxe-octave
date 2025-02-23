# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-glib2
$(PKG)_NAME     := glib2
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.82.4-1
$(PKG)_CHECKSUM := d85929b7b5c57c8a8f7873a8dc39bf0907028dc3
$(PKG)_SUBDIR   := 
$(PKG)_FILE     := $($(PKG)_NAME)-$($(PKG)_VERSION).src.tar.zst
$(PKG)_URL      := $(MSYS2_SRC_URL)/$($(PKG)_FILE)

$(PKG)_DEPS     := 

define $(PKG)_UPDATE
    $(WGET) -q -O- '$(MSYS2_BASE_URL)/' | \
    $(SED) -n 's,.*title="$($(PKG)_NAME)-\([0-9][^"]*\)".*,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
endef
