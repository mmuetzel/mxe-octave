# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-ca-certificates
$(PKG)_NAME     := ca-certificates
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 20210119-1
$(PKG)_CHECKSUM := cad949a1f34c4a2c71021b331b88bde82ead1482
$(PKG)_SUBDIR   := 
$(PKG)_FILE     := $($(PKG)_NAME)-$($(PKG)_VERSION).src.tar.gz
$(PKG)_URL      := $(MSYS2_SRC_URL)/$($(PKG)_FILE)

$(PKG)_DEPS     := 

define $(PKG)_UPDATE
    $(WGET) -q -O- '$(MSYS2_BASE_URL)/' | \
    $(SED) -n 's,.*title="$($(PKG)_NAME)-\([0-9][^"]*\)".*,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
endef
