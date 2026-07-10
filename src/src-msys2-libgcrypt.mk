# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-libgcrypt
$(PKG)_NAME     := libgcrypt
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.12.2-1
$(PKG)_CHECKSUM := cfb4c3da295716696d995c3ecbbf178edaa2babf
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
