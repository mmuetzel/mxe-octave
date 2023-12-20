# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-ncurses
$(PKG)_NAME     := ncurses
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 6.4-2
$(PKG)_x86_64_CS := 33e089e41760255f4cba49ea3d209d378c25dca9
$(PKG)_i686_CS  := dd244a842c1d0c75e91a8023cfb0d1ebfed72bae
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
