# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libbz2
$(PKG)_NAME     := libbz2
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.0.8-4
$(PKG)_x86_64_CS := 4338397490b5166f13e5d63162789efda41bd980
$(PKG)_i686_CS  := 1bf75ffba8d07512c00b1bdd193fdd74751acc9b
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
