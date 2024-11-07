# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-libxml2
$(PKG)_NAME     := libxml2
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.13.4-1
$(PKG)_CHECKSUM := be692b6dc0cfd08870826ff99b175fa1057113e8
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
