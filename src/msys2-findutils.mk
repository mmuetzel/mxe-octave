# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-findutils
$(PKG)_NAME     := findutils
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.10.0-2
$(PKG)_x86_64_CS := 60dd0d6d3b1ab3f15dee5aeda5a77226a2a87255
$(PKG)_i686_CS  := cfbfe2fd8e2c086ae1e633dc48493d9a5ac1961a
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
