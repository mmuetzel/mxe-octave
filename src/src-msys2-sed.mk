# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-sed
$(PKG)_NAME     := sed
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.8-3
$(PKG)_CHECKSUM := 638fb77b52d68c9c7f0a3fc2cfc915cad8f7fb5d
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
