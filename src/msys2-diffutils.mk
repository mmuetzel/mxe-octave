# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-diffutils
$(PKG)_NAME     := diffutils
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.10-1
$(PKG)_x86_64_CS := fe677d9c7c39d28d50f106568c31b3dcd1ff7836
$(PKG)_i686_CS  := 5957051ba450e0fc943303fa904720e4792b3d22
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
