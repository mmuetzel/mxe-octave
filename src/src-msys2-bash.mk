# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-bash
$(PKG)_NAME     := bash
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 5.2.026-1
$(PKG)_CHECKSUM := 5ad2277373eefc9b2a249c4e1e752476e4dc91ff
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
