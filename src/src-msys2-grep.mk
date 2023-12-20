# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-grep
$(PKG)_NAME     := grep
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1~3.0-6
$(PKG)_CHECKSUM := 40f04069fbe2058693fcb23b3b247e367c43dc2a
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
