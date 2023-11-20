# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libgpgme
$(PKG)_NAME     := libgpgme
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.23.1-1
$(PKG)_x86_64_CS := c981065da0625c157477f621594a79c660ad4d96
$(PKG)_i686_CS  := 9582993ccbf85f2d7606077b62fb140f89d20acf
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
