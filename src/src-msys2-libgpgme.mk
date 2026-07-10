# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-libgpgme
$(PKG)_NAME     := gpgme
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.0.1-1
$(PKG)_CHECKSUM := e55e44591835204c6fa8eb37a3aea4b480687bdd
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
