# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-liblzma
$(PKG)_NAME     := liblzma
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 5.4.1-1
$(PKG)_x86_64_CS := b36323cbebc5dce9b0b549435b1fd81b524c4cda
$(PKG)_i686_CS  := db38d33beea6623e1a747f71e10dd0123b2f75c7
$(PKG)_CS       := $($(PKG)_$(MSYS2_ARCH)_CS)
$(PKG)_CHECKSUM := $($(PKG)_CS)
$(PKG)_SUBDIR   := 
$(PKG)_FILE     := $($(PKG)_NAME)-$($(PKG)_VERSION)-$(MSYS2_ARCH).pkg.tar.zst
$(PKG)_URL      := $(MSYS2_URL)/$($(PKG)_FILE)
$(PKG)_URL2     := $(if $(MSYS2_URL2),$(MSYS2_URL2)/$($(PKG)_FILE),)

$(PKG)_DEPS     := 

define $(PKG)_UPDATE
    $(MSYS2_PKG_UPDATE)
endef

define $(PKG)_BUILD
    $(MSYS2_PKG_BUILD)
endef
