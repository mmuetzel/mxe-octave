# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-tar
$(PKG)_NAME     := tar
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.34-3
$(PKG)_CHECKSUM := eae38c62fbdc196c3e9f4d3b2f9f57725a7b873b
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
