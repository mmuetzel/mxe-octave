# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-libxslt
$(PKG)_NAME     := libxslt
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.1.45-1
$(PKG)_CHECKSUM := f3ef1c3701dbfd60456a72d619d5fb924c7635b7
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
