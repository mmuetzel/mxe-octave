# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-findutils
$(PKG)_NAME     := findutils
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.10.0-3
$(PKG)_CHECKSUM := 354aee00cdc6fe45e3c8e8faf70871f70322ae8a
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
