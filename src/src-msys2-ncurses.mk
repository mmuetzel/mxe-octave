# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-ncurses
$(PKG)_NAME     := ncurses
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 6.6-2
$(PKG)_CHECKSUM := 8c6dcaee2326cd15abc92743ccdfe96164d4312e
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
