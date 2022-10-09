# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-libsqlite
$(PKG)_NAME     := sqlite
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.39.2-1
$(PKG)_CHECKSUM := 6c7e902b9e545e807c727afc3fb3131bd2dccd01
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
