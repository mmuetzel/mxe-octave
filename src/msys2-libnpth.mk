# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libnpth
$(PKG)_NAME     := libnpth
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.8-1
$(PKG)_x86_64_CS := 4dcb6ca3418862a5b408b6ba1eeaacb2edb069ab
$(PKG)_i686_CS  := 7b5839ec952c6d504fb9ee915070a751a1780270
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
