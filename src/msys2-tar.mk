# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-tar
$(PKG)_NAME     := tar
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.35-3
$(PKG)_x86_64_CS := 332a49a0dd938482cd5d6f3fa1abf2eaa4cd47f6
$(PKG)_i686_CS  := 07825b09b4e4274422401ec284716bcb9957d11d
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
