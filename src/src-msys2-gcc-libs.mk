# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-gcc-libs
$(PKG)_NAME     := gcc
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 13.3.0-1
$(PKG)_CHECKSUM := c77edd2cc3c81f83f83b349732397d99a1f89eda
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
