# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-p11-kit
$(PKG)_NAME     := p11-kit
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.25.10-1
$(PKG)_CHECKSUM := a3e110131d232f90e7ed739a4c2ab00611df11b3
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
