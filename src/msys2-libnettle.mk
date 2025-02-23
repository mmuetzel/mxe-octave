# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libnettle
$(PKG)_NAME     := libnettle
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.10.1-1
$(PKG)_x86_64_CS := 0d3e5aae902a4110a31f6a8d6c412200344e72ef
$(PKG)_i686_CS  := 6ac7093c5b6dfe67cffdf1bda3a1e4ebb314c6b1
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
