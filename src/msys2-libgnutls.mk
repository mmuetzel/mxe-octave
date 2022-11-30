# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libgnutls
$(PKG)_NAME     := libgnutls
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.7.8-1
$(PKG)_x86_64_CS := 29f8073ef0dda53db98377cf0da9cda85cb21d60
$(PKG)_i686_CS  := 6aa1155504092f9161a4e74199064cc13a8bc9d0
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
