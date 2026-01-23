# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-dos2unix
$(PKG)_NAME     := dos2unix
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 7.5.3-1
$(PKG)_CHECKSUM := 34292a8319704cf3ca696de3887f52ccd38dddb3
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
