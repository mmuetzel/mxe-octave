# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libpsl
$(PKG)_NAME     := libpsl
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.21.1-2
$(PKG)_x86_64_CS := 790e9da9b3a7d5b62563946f3da0602bdbac8a75
$(PKG)_i686_CS  := 65e5a1d26d62a4c79e8f67fa8156e646dae379d5
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
