# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-bash
$(PKG)_NAME     := bash
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 5.2.026-1
$(PKG)_x86_64_CS := 2191e749d5b9c4d43d2d4fdec7b23efd75a73c97
$(PKG)_i686_CS  := 8bfa7067facaa9592dd7ad78f01bce751f066535
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
