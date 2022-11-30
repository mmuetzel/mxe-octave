# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-icu
$(PKG)_NAME     := icu
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 71.1-2
$(PKG)_CHECKSUM := 53c88a1f5a9994e6b49e6e0917f6150fb187b761
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
