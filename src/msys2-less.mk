# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-less
$(PKG)_NAME     := less
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 661-1
$(PKG)_x86_64_CS := 9fbda3d84209aa74d0cd947cf4d7774a418ba2e6
$(PKG)_i686_CS  := 5a73ec7c6ae302087a5ee89b847be90d835d6743
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
