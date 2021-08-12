# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-icu
$(PKG)_NAME     := icu
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 68.2-1
$(PKG)_CHECKSUM := f6db549ca8e4b74350321379cd01a1fb8c410053
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
