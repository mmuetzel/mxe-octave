# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-info
$(PKG)_NAME     := texinfo
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 6.7-3
$(PKG)_CHECKSUM := f20e8d34521526b58cfda23da6038513c68e0258
$(PKG)_SUBDIR   := 
$(PKG)_FILE     := $($(PKG)_NAME)-$($(PKG)_VERSION).src.tar.gz
$(PKG)_URL      := $(MSYS2_SRC_URL)/$($(PKG)_FILE)

$(PKG)_DEPS     := 

define $(PKG)_UPDATE
    $(WGET) -q -O- '$(MSYS2_BASE_URL)/' | \
    $(SED) -n 's,.*title="$($(PKG)_NAME)-\([0-9][^"]*\)".*,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
endef
