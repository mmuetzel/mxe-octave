# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-libksba
$(PKG)_NAME     := libksba
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.8.0-1
$(PKG)_CHECKSUM := 3f632f5196549e143f09c9af3aa0fdf241b73c81
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
