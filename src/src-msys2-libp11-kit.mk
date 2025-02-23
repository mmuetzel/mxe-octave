# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-libp11-kit
$(PKG)_NAME     := p11-kit
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.25.5-2
$(PKG)_CHECKSUM := 46d25f489ac169fae915b7be5425ad8537f62aaa
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
