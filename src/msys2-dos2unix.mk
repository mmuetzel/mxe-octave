# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-dos2unix
$(PKG)_NAME     := dos2unix
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 7.5.2-1
$(PKG)_x86_64_CS := e28e5ec204155333688439220aa4cf33fa748cdd
$(PKG)_i686_CS  := 6fa9cc80e6b1623a51ce876efcd7080119a6ba1c
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
