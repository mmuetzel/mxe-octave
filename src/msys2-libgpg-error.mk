# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libgpg-error
$(PKG)_NAME     := libgpg-error
$(PKG)_IGNORE   :=
$(PKG)_x86_64_VERSION  := 1.58-1
$(PKG)_x86_64_CS := a99e8364567ab880b5c8b7b5aa8c35b31e5eded1
$(PKG)_i686_VERSION  := 1.56-1
$(PKG)_i686_CS  := 0cb363f5e16bc59c73d97f88224c120fa2ac4a02
$(PKG)_CS       := $($(PKG)_$(MSYS2_ARCH)_CS)
$(PKG)_CHECKSUM := $($(PKG)_CS)
$(PKG)_VERSION  := $($(PKG)_$(MSYS2_ARCH)_VERSION)
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
