# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-libnpth
$(PKG)_NAME     := npth
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.6-2
$(PKG)_CHECKSUM := 4759871d40ad35fe89889fd4ce7a771e52d91ac2
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
