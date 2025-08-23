# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libreadline
$(PKG)_NAME     := libreadline
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 8.3.001-1
$(PKG)_x86_64_CS := 4da891ad335cc3bce6e537aed563445a28664f5b
$(PKG)_i686_CS  := cdeb47cc5c058543f50473361be0f02693467e8c
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
