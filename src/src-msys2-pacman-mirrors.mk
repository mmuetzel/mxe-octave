# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-pacman-mirrors
$(PKG)_NAME     := pacman-mirrors
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 20221016-1
$(PKG)_CHECKSUM := 88ffeeb74b1278ac6d146c8756018fc6c7e707a3
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
