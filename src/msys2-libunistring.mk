# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libunistring
$(PKG)_NAME     := libunistring
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.1-2
$(PKG)_x86_64_CS := 750d6841c79630421a773d47d0d730eea4ad4ab4
$(PKG)_i686_CS  := b96427e9edde5e7057e515816f590a6f1b318e1b
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
