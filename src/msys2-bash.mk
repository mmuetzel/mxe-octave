# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-bash
$(PKG)_NAME     := bash
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 5.2.009-1
$(PKG)_x86_64_CS := 4d973772dcc7729d833dd94c200ddf1dbd932431
$(PKG)_i686_CS  := 7f55519517cc3dc0a515f835295e491bf8cc1ba2
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
