# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-openssl
$(PKG)_NAME     := openssl
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.2.1-1
$(PKG)_x86_64_CS := c9bb46a28d74b5ae1b8dbb5bf7d33efbe7bfdba6
$(PKG)_i686_CS  := b6a08d1c8af2886b4ee5fc82a22ff5e87b099469
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
