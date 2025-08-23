# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-gcc-libs
$(PKG)_NAME     := gcc-libs
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 15.1.0-2
$(PKG)_x86_64_CS := e95c6eca0d41db7d08973296de5ff6c89cc64152
$(PKG)_i686_CS  := c3987617fd16c70c00f2d675b79c60b5876b3579
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
