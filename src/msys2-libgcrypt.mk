# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libgcrypt
$(PKG)_NAME     := libgcrypt
$(PKG)_IGNORE   :=
$(PKG)_x86_64_VERSION  := 1.12.2-1
$(PKG)_x86_64_CS := b53f62301c20629baad5277f45c142b1b87ce1d7
$(PKG)_i686_VERSION  := 1.11.2-1
$(PKG)_i686_CS  := 692e7a6914d0370c64b9a66319e9f2c151c42012
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
