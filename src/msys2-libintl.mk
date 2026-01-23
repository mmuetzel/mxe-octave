# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libintl
$(PKG)_NAME     := libintl
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.22.5-1
$(PKG)_x86_64_CS := b984fe31976477e82c0af9ea4b335ec2b4b6114f
$(PKG)_i686_CS  := 9b7717fd9f1a2fef943e966ea8f1c284ccb0ef89
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
