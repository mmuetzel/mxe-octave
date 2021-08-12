# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-tar
$(PKG)_NAME     := tar
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.34-1
$(PKG)_CHECKSUM := 7b38d42e46e61731db29cef0cb6b4688960017b0
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
