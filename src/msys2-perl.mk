# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-perl
$(PKG)_NAME     := perl
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 5.36.1-2
$(PKG)_x86_64_CS := a85485cb83b441ac78221ae3a8a3eaef6f55edfc
$(PKG)_i686_CS  := 284b9ff843f84d41a0be7cafc544d149d2ea45f7
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
