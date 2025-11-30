# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libexpat
$(PKG)_NAME     := libexpat
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.7.3-1
$(PKG)_x86_64_CS := 4516743796cfe2c2fe4eb6999148ee50d0978cea
$(PKG)_i686_CS  := ab8c363538e8e3f8b8d7910cdd4842399c81d6c0
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
