# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-perl
$(PKG)_NAME     := perl
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 5.38.2-2
$(PKG)_CHECKSUM := 947282b259060df7ecc7d5146e555a60e9545a8c
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
