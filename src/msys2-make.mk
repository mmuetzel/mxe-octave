# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-make
$(PKG)_NAME     := make
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.4-1
$(PKG)_x86_64_CS := 7a7e014f83c61c11910bd20e5e10f4b497fb3c92
$(PKG)_i686_CS  := b4bba2081716ea9ba5ddf55af1d93d6e5c65d359
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
