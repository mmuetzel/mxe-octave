# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libopenssl
$(PKG)_NAME     := libopenssl
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.2.1-1
$(PKG)_x86_64_CS := ecbafca9d8b690b0bd6f6b331a5e22299d9f054b
$(PKG)_i686_CS  := 8aa66f808703aeb6433707ac4c4ecb72fc3e6eeb
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
