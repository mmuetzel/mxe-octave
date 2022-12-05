# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libutil-linux
$(PKG)_NAME     := libutil-linux
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.35.2-3
$(PKG)_x86_64_CS := e06ae1176e28f1675c441def8c437075aa082f80
$(PKG)_i686_CS  := bc0df067583d2afa5cd10d9b1c7a364b133b4222
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
