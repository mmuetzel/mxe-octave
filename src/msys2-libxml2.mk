# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libxml2
$(PKG)_NAME     := libxml2
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.9.10-9
$(PKG)_x86_64_CS := c1124aa1f6fc77d09900f11fb951dd29e53c1f34
$(PKG)_i686_CS  := f97d29e0e2d046fb108691d8579680a2f160d9cd
$(PKG)_CS       := $($(PKG)_$(MSYS2_ARCH)_CS)
$(PKG)_CHECKSUM := $($(PKG)_CS)
$(PKG)_SUBDIR   := 
$(PKG)_FILE     := $($(PKG)_NAME)-$($(PKG)_VERSION)-$(MSYS2_ARCH).pkg.tar.zst
$(PKG)_URL      := $(MSYS2_URL)/$($(PKG)_FILE)

$(PKG)_DEPS     := 

define $(PKG)_UPDATE
    $(MSYS2_PKG_UPDATE)
endef

define $(PKG)_BUILD
    $(MSYS2_PKG_BUILD)
endef
