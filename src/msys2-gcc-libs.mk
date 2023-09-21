# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-gcc-libs
$(PKG)_NAME     := gcc-libs
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 13.2.0-2
$(PKG)_x86_64_CS := 90b740d2ccbad40b1cc7864180439cfd04f8a5c6
$(PKG)_i686_CS  := ec6865ca98e745f5a9dfa1a3784e93d074425c65
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
