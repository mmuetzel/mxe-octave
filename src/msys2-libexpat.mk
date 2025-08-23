# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libexpat
$(PKG)_NAME     := libexpat
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.7.1-1
$(PKG)_x86_64_CS := a61789a94fe5d36b9ead73f1cc65fe4651d71b00
$(PKG)_i686_CS  := 1822853834c52bbfb0fe0f0462a7f8cc188ca71c
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
