# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libtasn1
$(PKG)_NAME     := libtasn1
$(PKG)_IGNORE   :=
$(PKG)_x86_64_VERSION  := 4.21.0-1
$(PKG)_x86_64_CS := 6613c78b343b9b6a8081c2f33e32148b9601b07d
$(PKG)_i686_VERSION  := 4.20.0-1
$(PKG)_i686_CS  := ac63def8b380d59fad652b3a5ead4f7fb5b6ec1e
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
