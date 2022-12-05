# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-mpfr
$(PKG)_NAME     := mpfr
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.1.1.p1-1
$(PKG)_CHECKSUM := d3cbb6198cf3ebfa7e8c60930c54b7f209f43cf7
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
