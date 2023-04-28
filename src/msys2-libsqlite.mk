# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libsqlite
$(PKG)_NAME     := libsqlite
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.41.2-3
$(PKG)_x86_64_CS := 21d4f54e1cedb4a2b2206597beb4e63c6163c92d
$(PKG)_i686_CS  := 6634d5a7e628cb81821a247f1e053275de6dde1e
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
