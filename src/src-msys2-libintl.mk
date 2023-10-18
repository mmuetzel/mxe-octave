# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-libintl
$(PKG)_NAME     := gettext
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.22.3-1
$(PKG)_CHECKSUM := 2861b9bc26af40001c53df9a4966f4e9501456ac
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
