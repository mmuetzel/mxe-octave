# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-gnupg
$(PKG)_NAME     := gnupg
$(PKG)_IGNORE   :=
$(PKG)_x86_64_VERSION  := 2.4.9-1
$(PKG)_x86_64_CS := 49cc8957bbd470d5d3ef3590dab08dde6e4e3a97
$(PKG)_i686_VERSION  := 2.4.8-1
$(PKG)_i686_CS  := 1283ecb9212744691d3abe54d2c11043b41f971b
$(PKG)_CS       := $($(PKG)_$(MSYS2_ARCH)_CS)
$(PKG)_CHECKSUM := $($(PKG)_CS)
$(PKG)_VERSION  := $($(PKG)_$(MSYS2_ARCH)_VERSION)
$(PKG)_SUBDIR   := 
$(PKG)_FILE     := $($(PKG)_NAME)-$($(PKG)_VERSION)-$(MSYS2_ARCH).pkg.tar.zst
$(PKG)_URL      := $(MSYS2_URL)/$($(PKG)_FILE)
$(PKG)_URL2     := $(if $(MSYS2_URL2),$(MSYS2_URL2)/$($(PKG)_FILE),)

$(PKG)_DEPS     := msys2-libassuan msys2-libgcrypt

define $(PKG)_UPDATE
    $(MSYS2_PKG_UPDATE)
endef

define $(PKG)_BUILD
    $(MSYS2_PKG_BUILD)
endef
