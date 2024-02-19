# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-libpsl
$(PKG)_NAME     := libpsl
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.21.5-2
$(PKG)_CHECKSUM := 2784b7d81928e38388bc9f5930f155b9f41c1ee9
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
