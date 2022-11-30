# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-runtime
$(PKG)_NAME     := msys2-runtime
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.3.6-2
$(PKG)_CHECKSUM := ba16e0d999630456c1cc121f5feb24be2e8efbaa
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
