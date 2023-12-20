# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-gawk
$(PKG)_NAME     := gawk
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 5.3.0-1
$(PKG)_x86_64_CS := 7c5e9c6c9723f106f88e32791219f97838923902
$(PKG)_i686_CS  := bcdab258f152bb5459ebb747a96d3ed4b50ce1eb
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
