# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libintl
$(PKG)_NAME     := libintl
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.22.4-1
$(PKG)_x86_64_CS := 01412c8a84df5e3c478b716d52b9e663d19b1f75
$(PKG)_i686_CS  := f14c999a05c05239ee3d3e6232343018149cddf2
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
