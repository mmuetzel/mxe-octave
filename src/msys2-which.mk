# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-which
$(PKG)_NAME     := which
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.23-4
$(PKG)_x86_64_CS := 5f0a2641449c61e587e760cb42d04355aa3f9b56
$(PKG)_i686_CS  := ec90f1dd4b21eb2a9760a4aa29f6b39778ad795f
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
