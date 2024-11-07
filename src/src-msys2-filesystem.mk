# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-filesystem
$(PKG)_NAME     := filesystem
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2023.02.07-2
$(PKG)_CHECKSUM := 221f681c01f553e7a7e7862c759b410d6c4e97f6
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
