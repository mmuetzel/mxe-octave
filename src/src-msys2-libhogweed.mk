# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-libhogweed
$(PKG)_NAME     := nettle
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.7.3-1
$(PKG)_CHECKSUM := 87913feed891b81342e6c4c001e064f314e35261
$(PKG)_SUBDIR   := 
$(PKG)_FILE     := $($(PKG)_NAME)-$($(PKG)_VERSION).src.tar.gz
$(PKG)_URL      := $(MSYS2_SRC_URL)/$($(PKG)_FILE)

$(PKG)_DEPS     := 

define $(PKG)_UPDATE
    $(WGET) -q -O- '$(MSYS2_BASE_URL)/' | \
    $(SED) -n 's,.*title="$($(PKG)_NAME)-\([0-9][^"]*\)".*,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
endef
