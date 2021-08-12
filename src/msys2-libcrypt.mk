# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libcrypt
$(PKG)_NAME     := libcrypt
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.1-3
$(PKG)_x86_64_CS := e2da3af731c026a737c39ed042f3e51e9416bab4
$(PKG)_i686_CS  := 6fe9df8e5bfd1636c4ff84809e03047897ff6ab0
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
