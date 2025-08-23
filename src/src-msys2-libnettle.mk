# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-libnettle
$(PKG)_NAME     := nettle
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.10.2-1
$(PKG)_CHECKSUM := 2eb8250e21e322daf6df0ab797c7fb50fdf41207
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
