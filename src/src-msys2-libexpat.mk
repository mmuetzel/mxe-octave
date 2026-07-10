# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-libexpat
$(PKG)_NAME     := expat
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.8.2-1
$(PKG)_CHECKSUM := b8d887b28f64b73acf08fb576e8906111a2ee8d5
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
