# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libp11-kit
$(PKG)_NAME     := libp11-kit
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.24.1-4
$(PKG)_x86_64_CS := b919c0e12c8e963e43958bee851a7910f6c5ed87
$(PKG)_i686_CS  := 61e53152f7cc58058b7aa817c157d59b202a2cae
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
