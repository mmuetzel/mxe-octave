# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-gcc-libs
$(PKG)_NAME     := gcc-libs
$(PKG)_IGNORE   :=
$(PKG)_x86_64_VERSION  := 15.3.0-1
$(PKG)_x86_64_CS := c01b20fa8738550c585d142a316d38834f7d6e42
$(PKG)_i686_VERSION  := 15.2.0-1
$(PKG)_i686_CS  := 89355a9b2181f7e498baf30ea0427e41727a231f
$(PKG)_CS       := $($(PKG)_$(MSYS2_ARCH)_CS)
$(PKG)_CHECKSUM := $($(PKG)_CS)
$(PKG)_VERSION  := $($(PKG)_$(MSYS2_ARCH)_VERSION)
$(PKG)_SUBDIR   := 
$(PKG)_FILE     := $($(PKG)_NAME)-$($(PKG)_VERSION)-$(MSYS2_ARCH).pkg.tar.zst
$(PKG)_URL      := $(MSYS2_URL)/$($(PKG)_FILE)
$(PKG)_URL_2    := $(if $(MSYS2_URL2),$(MSYS2_URL2)/$($(PKG)_FILE),)

$(PKG)_DEPS     := 

define $(PKG)_UPDATE
    $(MSYS2_PKG_UPDATE)
endef

define $(PKG)_BUILD
    $(MSYS2_PKG_BUILD)
endef
