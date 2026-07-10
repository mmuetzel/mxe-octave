# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-unzip
$(PKG)_NAME     := unzip
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 6.0-3
$(PKG)_x86_64_CS := 848a6350142e0a82204f8993285f0e215224ec0d
$(PKG)_i686_CS  := 334d9774412f86dc57e4f69ba6fb09b46aa70c3d
$(PKG)_CS       := $($(PKG)_$(MSYS2_ARCH)_CS)
$(PKG)_CHECKSUM := $($(PKG)_CS)
$(PKG)_SUBDIR   := 
$(PKG)_FILE     := $($(PKG)_NAME)-$($(PKG)_VERSION)-$(MSYS2_ARCH).pkg.tar.zst
$(PKG)_URL      := $(MSYS2_URL)/$($(PKG)_FILE)
$(PKG)_URL_2    := $(if $(MSYS2_URL2),$(MSYS2_URL2)/$($(PKG)_FILE),)

$(PKG)_DEPS     := 

define $(PKG)_UPDATE
    $(MSYS2_PKG_UPDATE)
endef

define $(PKG)_BUILD
    $(MSYS2_PKG_BUILD)
endef
