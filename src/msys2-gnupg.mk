# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-gnupg
$(PKG)_NAME     := gnupg
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.4.3-2
$(PKG)_x86_64_CS := 37d3bcd5a8c844974a2f1be37993b3a4c7d01d50
$(PKG)_i686_CS  := 9a532c03de26f3680fc140b24cbacf24b8b0cd58
$(PKG)_CS       := $($(PKG)_$(MSYS2_ARCH)_CS)
$(PKG)_CHECKSUM := $($(PKG)_CS)
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
