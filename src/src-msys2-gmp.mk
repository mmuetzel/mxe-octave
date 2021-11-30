# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-gmp
$(PKG)_NAME     := gmp
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 6.2.1-1
$(PKG)_CHECKSUM := 5befe32118a009a7d49c1ed9e2d56e21d60f6e2f
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
