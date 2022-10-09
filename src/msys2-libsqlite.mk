# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libsqlite
$(PKG)_NAME     := libsqlite
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.39.2-1
$(PKG)_x86_64_CS := 955c99b0952492b881a0074f9d3f58a51b81e8de
$(PKG)_i686_CS  := 14439d77b42b6d8fc055eb25b71ec35621bec123
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
