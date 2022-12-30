# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-diffutils
$(PKG)_NAME     := diffutils
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.8-4
$(PKG)_x86_64_CS := c7d5f892cd384fd869f37c6bcb30e4d5a64c74e2
$(PKG)_i686_CS  := c555497a2261c46f76341aac43f975a15878afbe
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
