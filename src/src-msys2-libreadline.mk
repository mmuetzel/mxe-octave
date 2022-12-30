# This file is part of MXE.
# See index.html for further information.

PKG             := src-msys2-libreadline
$(PKG)_NAME     := readline
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 8.2.001-1
$(PKG)_CHECKSUM := 3e0255936341f2a9610f979c6f7669258863905f
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
