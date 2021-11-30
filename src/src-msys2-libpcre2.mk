# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-libpcre2
$(PKG)_NAME     := pcre2
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 10.37-1
$(PKG)_CHECKSUM := b3c9231489becbcf47ba02ab7c1108e0b636e1e7
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
