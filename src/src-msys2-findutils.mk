# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-findutils
$(PKG)_NAME     := findutils
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.10.0-2
$(PKG)_CHECKSUM := 474b3531fa33f6e2425f7d91ed9e599e00f158fc
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
