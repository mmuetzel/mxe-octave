# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libgpgme
$(PKG)_NAME     := libgpgme
$(PKG)_IGNORE   :=
$(PKG)_x86_64_VERSION  := 2.0.1-1
$(PKG)_x86_64_CS := 218ff4e2cb2729e022b8b188b84adcc7cf18e287
$(PKG)_i686_VERSION  := 1.24.3-1
$(PKG)_i686_CS  := 40e153a450b9476929367ddfc6fe12563b488c63
$(PKG)_CS       := $($(PKG)_$(MSYS2_ARCH)_CS)
$(PKG)_CHECKSUM := $($(PKG)_CS)
$(PKG)_VERSION  := $($(PKG)_$(MSYS2_ARCH)_VERSION)
$(PKG)_SUBDIR   := 
$(PKG)_FILE     := $($(PKG)_NAME)-$($(PKG)_VERSION)-$(MSYS2_ARCH).pkg.tar.zst
$(PKG)_URL      := $(MSYS2_URL)/$($(PKG)_FILE)
$(PKG)_URL_2    := $(if $(MSYS2_URL2),$(MSYS2_URL2)/$($(PKG)_FILE),)

$(PKG)_DEPS     := 

define $(PKG)_UPDATE
    $(MSYS2_PKG_UPDATE)
endef

define $(PKG)_BUILD
    $(MSYS2_PKG_BUILD)
endef
