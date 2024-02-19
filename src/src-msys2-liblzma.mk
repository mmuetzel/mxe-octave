# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-liblzma
$(PKG)_NAME     := xz
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 5.4.6-2
$(PKG)_CHECKSUM := 41c0cdcc0e9fb1dca13fe595f5a6be823ddb7440
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
