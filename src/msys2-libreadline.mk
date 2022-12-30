# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libreadline
$(PKG)_NAME     := libreadline
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 8.2.001-1
$(PKG)_x86_64_CS := 8f0ec3c44cc868bb93a6c00a6385a5bcaf7acdd7
$(PKG)_i686_CS  := e3ad908ad961e55e00baf07a4d20dfe0e34d17b8
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
