# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-libsqlite
$(PKG)_NAME     := sqlite
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.39.4-1
$(PKG)_CHECKSUM := 15df1827b17133bdd82c10cc80e99b67de0852f2
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
