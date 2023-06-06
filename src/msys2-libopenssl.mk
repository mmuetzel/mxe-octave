# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libopenssl
$(PKG)_NAME     := libopenssl
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.1.1-1
$(PKG)_x86_64_CS := b376562657fce9088eaf08b32cd2d19571b4512b
$(PKG)_i686_CS  := 958762a7921ac04d96ab9e5103a97d79c6d75b7a
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
