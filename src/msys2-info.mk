# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-info
$(PKG)_NAME     := info
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 7.1-2
$(PKG)_x86_64_CS := d1c837d4f7804677e993198ea5fba9b667f08b08
$(PKG)_i686_CS  := 83a4066bd4f131ef40ddcb7bd7084dc98631c473
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
