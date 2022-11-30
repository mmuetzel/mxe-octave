# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-libintl
$(PKG)_NAME     := gettext
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.21-2
$(PKG)_CHECKSUM := 3eeff5b551951146daeb8d1d7dd68379940d4a58
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
