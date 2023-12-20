# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-libassuan
$(PKG)_NAME     := libassuan
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.5.6-1
$(PKG)_CHECKSUM := f349530c6ace9c29edc8a58dd9c2714d583ce000
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
