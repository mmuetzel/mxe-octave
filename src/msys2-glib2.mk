# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-glib2
$(PKG)_NAME     := glib2
$(PKG)_IGNORE   :=
$(PKG)_x86_64_VERSION  := 2.86.3-1
$(PKG)_x86_64_CS := 494aefec4072f77aa069068aea3cdcfcd3cb7022
$(PKG)_i686_CS  := 4ca7e6fd54a39e23c6d94d0787aaa90816b9b309
$(PKG)_i686_VERSION  := 2.86.1-1
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
