# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-p11-kit
$(PKG)_NAME     := p11-kit
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.25.3-1
$(PKG)_x86_64_CS := 3a071f7f99bdf64c7d66678af8fdf03bd8daba52
$(PKG)_i686_CS  := 0d2585c4e5070dd304387ab5bd0fae861278fedd
$(PKG)_CS       := $($(PKG)_$(MSYS2_ARCH)_CS)
$(PKG)_CHECKSUM := $($(PKG)_CS)
$(PKG)_SUBDIR   := 
$(PKG)_FILE     := $($(PKG)_NAME)-$($(PKG)_VERSION)-$(MSYS2_ARCH).pkg.tar.zst
$(PKG)_URL      := $(MSYS2_URL)/$($(PKG)_FILE)
$(PKG)_URL2     := $(if $(MSYS2_URL2),$(MSYS2_URL2)/$($(PKG)_FILE),)

$(PKG)_DEPS     := msys2-libp11-kit

define $(PKG)_UPDATE
    $(MSYS2_PKG_UPDATE)
endef

define $(PKG)_BUILD
    $(MSYS2_PKG_BUILD)
endef
