# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libnettle
$(PKG)_NAME     := libnettle
$(PKG)_IGNORE   :=
$(PKG)_x86_64_VERSION  := 4.0-1
$(PKG)_x86_64_CS := 4b236c1fe73c90b308331d34c4754498dd19d809
$(PKG)_i686_VERSION  := 3.10.2-1
$(PKG)_i686_CS  := 48062f6434f5365d18b146164082611c452df13c
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
