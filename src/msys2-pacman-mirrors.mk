# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-pacman-mirrors
$(PKG)_NAME     := pacman-mirrors
$(PKG)_IGNORE   :=
$(PKG)_x86_64_VERSION  := 20260102-1
$(PKG)_i686_VERSION  := 20250607-1
# the mirror package is NOT the same for both systems, but same name
$(PKG)_i686_CS  := 873592a36e5cb0cd9897b355a7fff83cb0194d00
$(PKG)_x86_64_CS := 137b0dbf3fda7b32412030d959db52ea0cdbb6be
$(PKG)_CS       := $($(PKG)_$(MSYS2_ARCH)_CS)
$(PKG)_CHECKSUM := $($(PKG)_CS)
$(PKG)_VERSION  := $($(PKG)_$(MSYS2_ARCH)_VERSION)
$(PKG)_SUBDIR   := 
$(PKG)_FILE     := $($(PKG)_NAME)-$($(PKG)_VERSION)-$(MSYS2_ARCH).pkg.tar.zst
$(PKG)_URL      := $(MSYS2_URL)/$($(PKG)_NAME)-$($(PKG)_VERSION)-any.pkg.tar.zst

$(PKG)_DEPS     := 

define $(PKG)_UPDATE
    $(MSYS2_PKG_UPDATE)
endef

define $(PKG)_BUILD
    $(MSYS2_PKG_BUILD)
endef
