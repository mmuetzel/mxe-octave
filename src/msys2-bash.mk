# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-bash
$(PKG)_NAME     := bash
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 5.2.021-1
$(PKG)_x86_64_CS := eaf69c7b9841cbc51f860ddaa4af91413c119a96
$(PKG)_i686_CS  := a9171236425aa50d02acb932b9b87bbd5a0f6e4c
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
