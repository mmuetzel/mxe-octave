# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-less
$(PKG)_NAME     := less
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 661-1
$(PKG)_CHECKSUM := 65137ed4da4f8cb96b13f0a317da0b859077835a
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
