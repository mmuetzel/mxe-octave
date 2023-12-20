# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-zlib
$(PKG)_NAME     := zlib
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.3-1
$(PKG)_CHECKSUM := 663aa0fc7bd98d1436aeeed818be9cb3773f3834
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
