# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-libgpg-error
$(PKG)_NAME     := libgpg-error
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.61-1
$(PKG)_CHECKSUM := e5da765b4eec72e15ce7c533c44f807e2c033302
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
