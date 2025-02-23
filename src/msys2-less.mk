# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-less
$(PKG)_NAME     := less
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 668-1
$(PKG)_x86_64_CS := 55e48ca60db737978d2def4ebd97b1cc38b2ba47
$(PKG)_i686_CS  := 59b13d9c921e10681fcca58dc24b01fc36d36988
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
