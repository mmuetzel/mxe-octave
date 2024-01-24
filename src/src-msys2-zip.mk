# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-zip
$(PKG)_NAME     := zip
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.0-4
$(PKG)_CHECKSUM := 458bd965cf13d7eb08478c64b61e5eb8b8bad694
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
