# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libxcrypt
$(PKG)_NAME     := libxcrypt
$(PKG)_IGNORE   :=
$(PKG)_x86_64_VER := 4.5.2-1
$(PKG)_i686_VER  := 4.4.38-1
$(PKG)_VERSION  := $($(PKG)_$(MSYS2_ARCH)_VER)
$(PKG)_x86_64_CS := 8223897ac1c8c795e8097df0d03200da20e64aa7
$(PKG)_i686_CS  := ef59472d84adb98cfb18e62aa73354fe8e38671f
$(PKG)_CS       := $($(PKG)_$(MSYS2_ARCH)_CS)
$(PKG)_CHECKSUM := $($(PKG)_CS)
$(PKG)_SUBDIR   := 
$(PKG)_FILE     := $($(PKG)_NAME)-$($(PKG)_VERSION)-$(MSYS2_ARCH).pkg.tar.zst
$(PKG)_URL      := $(MSYS2_URL)/$($(PKG)_FILE)
$(PKG)_URL_2    := $(if $(MSYS2_URL2),$(MSYS2_URL2)/$($(PKG)_FILE),)

$(PKG)_DEPS     := 

define $(PKG)_UPDATE
    $(MSYS2_PKG_UPDATE)
endef

define $(PKG)_BUILD
    $(MSYS2_PKG_BUILD)
endef
