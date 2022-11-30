# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-sed
$(PKG)_NAME     := sed
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.8-3
$(PKG)_x86_64_CS := 77f52e17cb0c85589b2ec42d3c4a0cafaaa20d88
$(PKG)_i686_CS  := b5411db4f00c77af8b40facf70248e69b511aa76
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
