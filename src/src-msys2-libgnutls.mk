# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-libgnutls
$(PKG)_NAME     := gnutls
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.7.9-1
$(PKG)_CHECKSUM := 294ec3779279a4bf0a64a1985b278b67cb2b2f9d
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
