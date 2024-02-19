# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-zlib
$(PKG)_NAME     := zlib
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.3.1-1
$(PKG)_x86_64_CS := ed833f1fde9bbbdc66c6513af788a6d9bd9b1820
$(PKG)_i686_CS  := 00e452ff42b4bb410302067dbb76725c98a358ae
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
