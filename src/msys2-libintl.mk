# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libintl
$(PKG)_NAME     := libintl
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.21-2
$(PKG)_x86_64_CS := 53416ede6dc08bde6af0e7986b1103576384b0af
$(PKG)_i686_CS  := ecbd6cc2c48f5486961b63c473470f5b0480877b
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
