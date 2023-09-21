# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libintl
$(PKG)_NAME     := libintl
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.22-2
$(PKG)_x86_64_CS := deaca766080a35776b564135d79b5268e1e35bb9
$(PKG)_i686_CS  := ef7f068dbfb96b21eb04f582c9a8cca3917195bb
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
