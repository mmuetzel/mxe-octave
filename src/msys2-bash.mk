# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-bash
$(PKG)_NAME     := bash
$(PKG)_IGNORE   :=
$(PKG)_x86_64_VERSION  := 5.3.009-1
$(PKG)_x86_64_CS := 3e5074acc8fd9efee593e2a39571f120f31b4bd0
$(PKG)_i686_VERSION  := 5.2.037-2
$(PKG)_i686_CS  := d4ccad0512addf1febcef506c2e001542578363e
$(PKG)_CS       := $($(PKG)_$(MSYS2_ARCH)_CS)
$(PKG)_CHECKSUM := $($(PKG)_CS)
$(PKG)_VERSION  := $($(PKG)_$(MSYS2_ARCH)_VERSION)
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
