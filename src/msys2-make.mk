# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-make
$(PKG)_NAME     := make
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.4.1-1
$(PKG)_x86_64_CS := fb49dc12540ca9608e7ae86b4ca552673bf6b733
$(PKG)_i686_CS  := 4aea74f88902512168ac3651642401fb4a3b059e
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
