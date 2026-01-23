# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-gmp
$(PKG)_NAME     := gmp
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 6.3.0-2
$(PKG)_CHECKSUM := 3b90177973eda75e0d4402dcd7d199af20d70e7f
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
