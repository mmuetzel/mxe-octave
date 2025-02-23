# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libxslt
$(PKG)_NAME     := libxslt
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.1.42-1
$(PKG)_x86_64_CS := 0a21b379cec0b3e630f37bf64ddb50d3e49950ed
$(PKG)_i686_CS  := c882a01bb6cd3812d2265b2e5fa5fbec93222106
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
