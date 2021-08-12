# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-which
$(PKG)_NAME     := which
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.21-2
$(PKG)_x86_64_CS := c6183ec9734892a55b94978d8b173bbe414e3e37
$(PKG)_i686_CS  := d8fba94924bf7a7015860029e6c48d64ec041c45
$(PKG)_CS       := $($(PKG)_$(MSYS2_ARCH)_CS)
$(PKG)_CHECKSUM := $($(PKG)_CS)
$(PKG)_SUBDIR   := 
$(PKG)_FILE     := $($(PKG)_NAME)-$($(PKG)_VERSION)-$(MSYS2_ARCH).pkg.tar.xz
$(PKG)_URL      := $(MSYS2_URL)/$($(PKG)_FILE)

$(PKG)_DEPS     := 

define $(PKG)_UPDATE
    $(MSYS2_PKG_UPDATE)
endef

define $(PKG)_BUILD
    $(MSYS2_PKG_BUILD)
endef
