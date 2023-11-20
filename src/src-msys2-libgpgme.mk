# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-libgpgme
$(PKG)_NAME     := gpgme
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.23.1-1
$(PKG)_CHECKSUM := e421a7899b691e3730e02ccce111b8cb040f5aaa
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
