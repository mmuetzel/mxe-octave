# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libnettle
$(PKG)_NAME     := libnettle
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.9.1-1
$(PKG)_x86_64_CS := 4c3273b6439217651e2f2e84a45f7a20426f8a03
$(PKG)_i686_CS  := 6b5f54d4ff96fd19a84f418af3ac85c65f8bc00c
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
