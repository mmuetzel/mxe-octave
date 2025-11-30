# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libsqlite
$(PKG)_NAME     := libsqlite
$(PKG)_IGNORE   :=
$(PKG)_x86_64_VER := 3.51.1-1
$(PKG)_i686_VER  := 3.50.4-1
$(PKG)_VERSION  := $($(PKG)_$(MSYS2_ARCH)_VER)
$(PKG)_x86_64_CS := c130cf44f3d1aa1b7617e2d36ad60237efc4a563
$(PKG)_i686_CS  := 6673998bd72648d03ad2aaf7fc4b10fe01552083
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
