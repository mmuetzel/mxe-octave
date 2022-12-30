# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-coreutils
$(PKG)_NAME     := coreutils
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 8.32-5
$(PKG)_CHECKSUM := 71e71aa6a0b934e36b0d0b86bcabae754ecaa9f2
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
