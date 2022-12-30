# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-libutil-linux
$(PKG)_NAME     := util-linux
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.35.2-3
$(PKG)_CHECKSUM := 83a4e943497f6c0b781d89f6d0903e035aa8d439
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
