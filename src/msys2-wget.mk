# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-wget
$(PKG)_NAME     := wget
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.21.3-1
$(PKG)_x86_64_CS := a0212a39dc95ef3c70f07a15f331234fc3de578b
$(PKG)_i686_CS  := a3b882a64527e0f8c07b59db18c08def751b4e32
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
