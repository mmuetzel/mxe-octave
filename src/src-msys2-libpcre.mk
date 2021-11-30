# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-libpcre
$(PKG)_NAME     := pcre
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 8.45-1
$(PKG)_CHECKSUM := 7ecb3c6b4b2e57a5d112d4ed5955c4059f45b328
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
