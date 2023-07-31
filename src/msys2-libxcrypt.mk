# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libxcrypt
$(PKG)_NAME     := libxcrypt
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.4.36-1
$(PKG)_x86_64_CS := a7a1cc7ec40ae6e33b0f2ff7cf0477194b70e4a1
$(PKG)_i686_CS  := 3056a9b2123602bba44cfd3faa56d622b6c80a3c
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
