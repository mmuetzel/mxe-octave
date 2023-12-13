# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libxml2
$(PKG)_NAME     := libxml2
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.12.2-1
$(PKG)_x86_64_CS := 1e54d9af87491fd48ac5b54a49f1680eff90dbc8
$(PKG)_i686_CS  := 4267b2fc2ff438e1226cf629c5a3be4677d4974a
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
