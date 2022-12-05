# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-mintty
$(PKG)_NAME     := mintty
$(PKG)_IGNORE   :=
$(PKG)_x86_64_VER := 1~3.6.2-1
$(PKG)_i686_VER  := 1.3.6.2-1
$(PKG)_VERSION  := $($(PKG)_$(MSYS2_ARCH)_VER)
$(PKG)_FILTER   := mintty-1~
$(PKG)_x86_64_CS := d544068cb0b23a111d1436e4e0a2ff62e34ae65f
$(PKG)_i686_CS  := 73e73b5a8f7c7dd4237aed39499f548edf69367e
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
