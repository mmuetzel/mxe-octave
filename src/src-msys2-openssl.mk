# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-openssl
$(PKG)_NAME     := openssl
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.2.1-1
$(PKG)_CHECKSUM := 0e92618bd3a9009436e93964c1d73d9cab18c557
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
