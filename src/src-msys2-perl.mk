# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-perl
$(PKG)_NAME     := perl
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 5.36.1-2
$(PKG)_CHECKSUM := c09b7a8c0386e309ac30deb42cdaf3a8c91a3b0d
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
