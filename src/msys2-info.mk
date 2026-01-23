# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-info
$(PKG)_NAME     := info
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 7.2-2
$(PKG)_x86_64_CS := 1ee06fdfdba9489a1cdd3ccd1979e3ebe2e49cb8
$(PKG)_i686_CS  := d787b73668c84fbf1dacdda22d5ddcc513803458
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
