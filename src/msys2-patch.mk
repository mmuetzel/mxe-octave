# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-patch
$(PKG)_NAME     := patch
$(PKG)_IGNORE   :=
$(PKG)_x86_64_VERSION  := 2.7.6-3
$(PKG)_x86_64_CS := 31de2a1e9264d3d1009729b7c0c07f2192c0f3d5
$(PKG)_i686_VERSION  := 2.7.6-2
$(PKG)_i686_CS  := c749f589e4526296d7f9ff7e27a609f2f22faff1
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
