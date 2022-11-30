# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-gzip
$(PKG)_NAME     := gzip
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.12-2
$(PKG)_CHECKSUM := f83bc7df61d3e243d9d152c29e00635f366d4c6d
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
