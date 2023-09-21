# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-openssl
$(PKG)_NAME     := openssl
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.1.2-1
$(PKG)_x86_64_CS := 960eda9354e686c612e8bc455e91113a4b3d0a1b
$(PKG)_i686_CS  := e466e374a7b4e3933eff18851d5c06e4e38f326a
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
