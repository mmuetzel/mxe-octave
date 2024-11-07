# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-python
$(PKG)_NAME     := python
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.12.7-1
$(PKG)_CHECKSUM := 877720651032c08c1a1be9ce7877380ddb871a65
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
