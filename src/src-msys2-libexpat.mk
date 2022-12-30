# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-libexpat
$(PKG)_NAME     := expat
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.5.0-1
$(PKG)_CHECKSUM := 1370693ae83fb11a1b8d7f73bd13d1fe840801e2
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
