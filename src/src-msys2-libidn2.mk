# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-libidn2
$(PKG)_NAME     := libidn2
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.3.4-2
$(PKG)_CHECKSUM := 0d46047937cf4dea7aee0a7eccc5bf4182158b01
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
