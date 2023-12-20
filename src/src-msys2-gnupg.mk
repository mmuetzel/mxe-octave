# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-gnupg
$(PKG)_NAME     := gnupg
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.2.41-1
$(PKG)_CHECKSUM := 94a250febe56fe1568c5c5d932c71959ebaccd1e
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
