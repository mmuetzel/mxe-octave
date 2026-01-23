# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-libffi
$(PKG)_NAME     := libffi
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.5.2-1
$(PKG)_CHECKSUM := 07ea7e7c2f244403623cc67f32d33aae4ace0e03
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
