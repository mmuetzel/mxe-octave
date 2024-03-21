# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libnpth
$(PKG)_NAME     := libnpth
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.7-1
$(PKG)_x86_64_CS := 72e7ad7522fdb73b9ce65ba8a91473a638f2f4d4
$(PKG)_i686_CS  := 504af2640215ba4d28eb0066945f5d7fb309e705
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
