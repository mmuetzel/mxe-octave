# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-pacman
$(PKG)_NAME     := pacman
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 6.1.0-21
$(PKG)_CHECKSUM := 1755d5055db555211404d952b9bd25701e378065
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
