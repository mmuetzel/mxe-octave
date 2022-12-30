# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-sed
$(PKG)_NAME     := sed
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.9-1
$(PKG)_CHECKSUM := 1cac17013c0cf52476441fbb54b1a5fe2a172439
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
