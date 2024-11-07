# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libksba
$(PKG)_NAME     := libksba
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.6.7-1
$(PKG)_x86_64_CS := ee921db0a76bdfea6ad9dfde63a8505911181eb3
$(PKG)_i686_CS  := 7ed973bd60d05d691f5540229801bb20c8eb3e45
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
