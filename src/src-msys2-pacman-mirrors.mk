# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-pacman-mirrors
$(PKG)_NAME     := pacman-mirrors
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 20241217-1
$(PKG)_CHECKSUM := 0ec96c66f94d57d2ef0a5b59e40855c72a85f317
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
