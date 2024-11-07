# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-pacman-mirrors
$(PKG)_NAME     := pacman-mirrors
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 20240523-1
# the mirror package is NOT the same for both systems, but same name
$(PKG)_i686_CS  := 887a3b2f173111642f261857da60974f9f61d615
$(PKG)_x86_64_CS := c25e5e742bc72ebf50eb30db9c30629a1b72484f
$(PKG)_CS       := $($(PKG)_$(MSYS2_ARCH)_CS)
$(PKG)_CHECKSUM := $($(PKG)_CS)
$(PKG)_SUBDIR   := 
$(PKG)_FILE     := $($(PKG)_NAME)-$($(PKG)_VERSION)-$(MSYS2_ARCH).pkg.tar.zst
$(PKG)_URL      := $(MSYS2_URL)/$($(PKG)_NAME)-$($(PKG)_VERSION)-any.pkg.tar.zst

$(PKG)_DEPS     := 

define $(PKG)_UPDATE
    $(MSYS2_PKG_UPDATE)
endef

define $(PKG)_BUILD
    $(MSYS2_PKG_BUILD)
endef
