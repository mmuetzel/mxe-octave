# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-zlib
$(PKG)_NAME     := zlib
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.2.13-1
$(PKG)_x86_64_CS := 0928ccf489476ab2d5118f068eb81e563856ea8a
$(PKG)_i686_CS  := 3bbb51d12d4df57818ed09400b1d9fdc807ca64c
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
