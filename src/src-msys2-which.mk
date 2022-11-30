# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-which
$(PKG)_NAME     := which
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.21-4
$(PKG)_CHECKSUM := 80d15322e8b8b6098e1abc5dce05292a44f314ac
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
