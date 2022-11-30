# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-libpsl
$(PKG)_NAME     := libpsl
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.21.1-4
$(PKG)_CHECKSUM := f31b9076e4bb77b3be98fba3d0cf43aa43e5ee41
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
