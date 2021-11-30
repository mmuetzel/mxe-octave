# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libp11-kit
$(PKG)_NAME     := libp11-kit
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.23.22-2
$(PKG)_x86_64_CS := 2b7022bbfc30801b7fef674d1d49698fc8003180
$(PKG)_i686_CS  := a00467c7b70e199c5f4fa834a1757be0bb5814a9
$(PKG)_CS       := $($(PKG)_$(MSYS2_ARCH)_CS)
$(PKG)_CHECKSUM := $($(PKG)_CS)
$(PKG)_SUBDIR   := 
$(PKG)_FILE     := $($(PKG)_NAME)-$($(PKG)_VERSION)-$(MSYS2_ARCH).pkg.tar.zst
$(PKG)_URL      := $(MSYS2_URL)/$($(PKG)_FILE)

$(PKG)_DEPS     := 

define $(PKG)_UPDATE
    $(MSYS2_PKG_UPDATE)
endef

define $(PKG)_BUILD
    $(MSYS2_PKG_BUILD)
endef
