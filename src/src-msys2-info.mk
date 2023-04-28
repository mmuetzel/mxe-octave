# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-info
$(PKG)_NAME     := texinfo
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 7.0.3-1
$(PKG)_CHECKSUM := c43767834d9af41cbf56961bbf9f02a47f179aae
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
