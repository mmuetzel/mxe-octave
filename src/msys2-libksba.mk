# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libksba
$(PKG)_NAME     := libksba
$(PKG)_IGNORE   :=
$(PKG)_x86_64_VERSION  := 1.8.0-1
$(PKG)_x86_64_CS := c975f37284c2e6b979e9fa98559c8040f7872918
$(PKG)_i686_VERSION  := 1.6.7-1
$(PKG)_i686_CS  := 7ed973bd60d05d691f5540229801bb20c8eb3e45
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
