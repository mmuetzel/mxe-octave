# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-libiconv
$(PKG)_NAME     := libiconv
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.19-1
$(PKG)_CHECKSUM := 4ff086902d6a320c64e0717b152d786c8a490b57
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
