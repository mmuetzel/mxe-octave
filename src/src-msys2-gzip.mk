# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-gzip
$(PKG)_NAME     := gzip
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.13-1
$(PKG)_CHECKSUM := 5c534330d54d49e6b26a5447000bd0c3c6307a4b
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
