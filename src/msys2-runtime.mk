# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-runtime
$(PKG)_NAME     := msys2-runtime
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.3.6-2
$(PKG)_x86_64_CS := bb002d7ad12373b09cde0d619cc2b65b15075fc4
$(PKG)_i686_CS  := 8ce69a118fe6028ae3a39cebba69598a9681575a
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
