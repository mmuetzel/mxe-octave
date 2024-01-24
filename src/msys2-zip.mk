# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-zip
$(PKG)_NAME     := zip
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.0-4
$(PKG)_x86_64_CS := fb50d265b262ce02785b31236a48d4a7c342fb46
$(PKG)_i686_CS  := b098c97d2b562e0c7c6665699486c51a1c476a0c
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
