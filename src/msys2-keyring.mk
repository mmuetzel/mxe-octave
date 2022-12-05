# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-keyring
$(PKG)_NAME     := msys2-keyring
$(PKG)_IGNORE   :=
$(PKG)_x86_64_VER := 1~20221024-1
$(PKG)_i686_VER  := 1.20221024-1
$(PKG)_VERSION  := $($(PKG)_$(MSYS2_ARCH)_VER)
$(PKG)_x86_64_CS := c9639076cf72d63380d6ec3b78a24f3e2fa75bbb
$(PKG)_i686_CS  := db6423464bdd227ebe6eae50796c1fdf46719b55
$(PKG)_CS       := $($(PKG)_$(MSYS2_ARCH)_CS)
$(PKG)_CHECKSUM := $($(PKG)_CS)
$(PKG)_SUBDIR   := 
$(PKG)_FILE     := $($(PKG)_NAME)-$($(PKG)_VERSION)-any.pkg.tar.zst
$(PKG)_URL      := $(MSYS2_URL)/$($(PKG)_FILE)
$(PKG)_URL2     := $(if $(MSYS2_URL2),$(MSYS2_URL2)/$($(PKG)_FILE),)

$(PKG)_DEPS     := 

define $(PKG)_UPDATE
    $(MSYS2_PKG_UPDATE)
endef

define $(PKG)_BUILD
    $(MSYS2_PKG_BUILD)
endef
