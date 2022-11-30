# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-dos2unix
$(PKG)_NAME     := dos2unix
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 7.4.3-1
$(PKG)_x86_64_CS := 0123e1da2849ba22c82b00fff85160215715e90c
$(PKG)_i686_CS  := 2a301b038177e8bd77a48f369dc2347e3f2e2057
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
