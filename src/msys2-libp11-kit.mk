# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libp11-kit
$(PKG)_NAME     := libp11-kit
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.25.0-1
$(PKG)_x86_64_CS := f3ebe04d24c8144fa1e93f70d3d8bd81d9f77ae1
$(PKG)_i686_CS  := 5dbb2d62088d78797fe85180fdf8329bd1bcbe71
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
