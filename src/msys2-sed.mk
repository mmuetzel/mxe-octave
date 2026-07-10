# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-sed
$(PKG)_NAME     := sed
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.9-1
$(PKG)_x86_64_CS := c44320fa2ed0d5eca5f0a2b5c9b543efbcf6d8e9
$(PKG)_i686_CS  := 8fc94e617f89cb915f7a176019247a36dd53b10a
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
