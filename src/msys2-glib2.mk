# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-glib2
$(PKG)_NAME     := glib2
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.76.4-1
$(PKG)_x86_64_CS := 948d76bcde86116dc5e494e9a43f9d73a98fcfa1
$(PKG)_i686_CS  := ac0b90c9e4f1aa82d9dad7b73868f058effdb702
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
