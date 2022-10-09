# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-gzip
$(PKG)_NAME     := gzip
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.12-2
$(PKG)_x86_64_CS := c16f31dca96194bbc09690116ed0f5a21abc0843
$(PKG)_i686_CS  := 1c48e95a75392edb9604fe1190cc2225b318c4c6
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
