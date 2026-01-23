# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-libreadline
$(PKG)_NAME     := readline
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 8.3.003-1
$(PKG)_CHECKSUM := 0080126b9d1ca00a503284bfbd2d881755c21edd
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
