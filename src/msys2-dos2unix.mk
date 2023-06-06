# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-dos2unix
$(PKG)_NAME     := dos2unix
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 7.5.0-1
$(PKG)_x86_64_CS := b4a0ade91f88353da2fdc9bca6941bb22bf2b449
$(PKG)_i686_CS  := c454b925b7bea06ac6764fc19b1d4ac38d12f664
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
