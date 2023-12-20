# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-gawk
$(PKG)_NAME     := gawk
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 5.3.0-1
$(PKG)_CHECKSUM := 6a0d1add010985abcf3043ac27c070a1b7c57dff
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
