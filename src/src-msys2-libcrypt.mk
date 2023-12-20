# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-libcrypt
$(PKG)_NAME     := libcrypt
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.1-5
$(PKG)_CHECKSUM := 05b6ce200f5c93525850bd0f2033408e43272895
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
