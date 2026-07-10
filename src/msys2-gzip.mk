# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-gzip
$(PKG)_NAME     := gzip
$(PKG)_IGNORE   :=
$(PKG)_x86_64_VERSION  := 1.14-2
$(PKG)_x86_64_CS := 2b5bf4dac675b541a9f559d0a0126c82b9170196
$(PKG)_i686_VERSION  := 1.14-1
$(PKG)_i686_CS  := 10454e3914c483a308d815c254bc7097f43ef8a8
$(PKG)_CS       := $($(PKG)_$(MSYS2_ARCH)_CS)
$(PKG)_CHECKSUM := $($(PKG)_CS)
$(PKG)_VERSION  := $($(PKG)_$(MSYS2_ARCH)_VERSION)
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
