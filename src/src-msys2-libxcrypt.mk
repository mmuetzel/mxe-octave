# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-libxcrypt
$(PKG)_NAME     := libxcrypt
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.4.38-1
$(PKG)_CHECKSUM := 8e6bf6b7dfebaf6b96bc2b0024d169708efcdf36
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
