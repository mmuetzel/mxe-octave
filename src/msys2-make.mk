# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-make
$(PKG)_NAME     := make
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.4.1-2
$(PKG)_x86_64_CS := 07e4a27f98b1a9fc658f522461ee33aadcd59626
$(PKG)_i686_CS  := 60489cc1fdb861bf3ad7250babc52689e092ef3a
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
