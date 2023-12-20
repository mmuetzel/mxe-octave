# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-ca-certificates
$(PKG)_NAME     := ca-certificates
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 20230311-1
$(PKG)_CHECKSUM := e0e190f0486ff664d5714f1a65b0ba102b638fec
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
