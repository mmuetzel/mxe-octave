# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libopenssl
$(PKG)_NAME     := libopenssl
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.1.3-1
$(PKG)_x86_64_CS := 6cff3b3f7c6a1992b36527e592d09e97b1964a6c
$(PKG)_i686_CS  := c84e49f6ed554ba09748ca2c85bcb9abf9ae6642
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
