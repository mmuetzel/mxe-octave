# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libpsl
$(PKG)_NAME     := libpsl
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.21.5-2
$(PKG)_x86_64_CS := 838fba404f9e62ec5af92af0feb3eb7f611482f3
$(PKG)_i686_CS  := 2754aab5f9f5c34c5bad0bd25600f62f3b274b13
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
