# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-libgnutls
$(PKG)_NAME     := gnutls
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.8.10-1
$(PKG)_CHECKSUM := d8ba8a93f8d0a2f2a21d2fa87317d0032f3dcf2d
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
