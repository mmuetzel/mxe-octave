# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libintl
$(PKG)_NAME     := libintl
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.22-1
$(PKG)_x86_64_CS := 330e514723c0e6548c35cf897e2477b4347c232b
$(PKG)_i686_CS  := 3035d5c4c591842573e4a04a43b61a8d5e0227dc
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
