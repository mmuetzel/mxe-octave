# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-which
$(PKG)_NAME     := which
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.21-2
$(PKG)_CHECKSUM := f18972325d78ab3ca79e3f426ec450de6636c263
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
