# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-pacman-mirrors
$(PKG)_NAME     := pacman-mirrors
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 20221016-1
# the mirror package is NOT the same for both systems, but same name
$(PKG)_i686_CS  := 15d6fea6b64c12e249e2c1d6a0272c446a16f03a
$(PKG)_x86_64_CS := 198fd2a194655e81a1c50e8d11a611f58376f9c2
$(PKG)_CS       := $($(PKG)_$(MSYS2_ARCH)_CS)
$(PKG)_CHECKSUM := $($(PKG)_CS)
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
