# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-mpfr
$(PKG)_NAME     := mpfr
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.2.0-2
$(PKG)_CHECKSUM := 844d7dabd95373a0a01021f6f5c44ae85f439984
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
