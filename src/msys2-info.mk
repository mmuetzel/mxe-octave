# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-info
$(PKG)_NAME     := info
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 7.1.1-1
$(PKG)_x86_64_CS := afc3b43cf8dcf00691330f3f2987b2cb466b5228
$(PKG)_i686_CS  := 4e400fd0d241679989c50f3d8467c422110f477b
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
