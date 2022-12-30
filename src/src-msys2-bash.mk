# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-bash
$(PKG)_NAME     := bash
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 5.2.009-1
$(PKG)_CHECKSUM := ddc98b4ec3073bd895f1c7882f0984f661d69348
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
