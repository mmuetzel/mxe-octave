# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-libxcrypt
$(PKG)_NAME     := libxcrypt
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.4.36-1
$(PKG)_CHECKSUM := 28bf05a8a8c57d6bfb200dfb5e6f6335139927b8
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
