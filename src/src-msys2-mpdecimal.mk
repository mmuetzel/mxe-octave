# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-mpdecimal
$(PKG)_NAME     := mpdecimal
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.5.1-2
$(PKG)_CHECKSUM := ecae02a4b19ad5be64f7a876bde58c46a506f4b2
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
