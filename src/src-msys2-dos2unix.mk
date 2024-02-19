# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-dos2unix
$(PKG)_NAME     := dos2unix
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 7.5.2-1
$(PKG)_CHECKSUM := 02cfb45f14d668e3caa3c11941cc1d71565db5f9
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
