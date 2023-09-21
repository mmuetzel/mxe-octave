# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-mintty
$(PKG)_NAME     := mintty
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1~3.6.5-1
$(PKG)_FILTER   := mintty-1~
$(PKG)_CHECKSUM := 9b83abd519e814311768ad197b39e64d7b5e59ab
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
