# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-wget
$(PKG)_NAME     := wget
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.21.4-1
$(PKG)_x86_64_CS := 932458ed5f5646ad9df3151ca107748c8d4a35af
$(PKG)_i686_CS  := 67502dc3a867b9a2113cb53c313ca6bd6ffa26da
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
