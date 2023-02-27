# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-python
$(PKG)_NAME     := python
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.11.2-1
$(PKG)_CHECKSUM := b362bbbfda18341fbd4f34c3b033f8066800eb50
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
