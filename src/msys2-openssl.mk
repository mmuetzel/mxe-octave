# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-openssl
$(PKG)_NAME     := openssl
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.2.0-1
$(PKG)_x86_64_CS := 437f8faedcc582feb6c76e2a28bf3fe9a022b040
$(PKG)_i686_CS  := 333308a5e858424792bd144f9041d9c769d3aa07
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
