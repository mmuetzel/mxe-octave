# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-libxslt
$(PKG)_NAME     := libxslt
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.1.42-1
$(PKG)_CHECKSUM := 6cac43f51a78f6351db4e89b494d2724ebc8b4de
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
