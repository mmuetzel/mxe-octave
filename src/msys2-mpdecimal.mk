# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-mpdecimal
$(PKG)_NAME     := mpdecimal
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.0.1-1
$(PKG)_x86_64_CS := 6360f145369669eb815f3302de924c18e6dcd941
$(PKG)_i686_CS  := cfb8cacf9a06d812cb4c56e06e8a31b9a0ac3db3
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
