# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libopenssl
$(PKG)_NAME     := libopenssl
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.1.4-1
$(PKG)_x86_64_CS := a4f078e41c516f9ba6e4897b916829801fb62a03
$(PKG)_i686_CS  := 5a8fd6a2b7a15a9f9aaf3d4ac2c44383e5ed03a3
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
