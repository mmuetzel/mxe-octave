# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-libxml2
$(PKG)_NAME     := libxml2
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.11.4-2
$(PKG)_CHECKSUM := 3acba63bdbf561fac0f4a5f8e0270ff3aa52aaa6
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
