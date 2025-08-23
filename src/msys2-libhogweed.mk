# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libhogweed
$(PKG)_NAME     := libhogweed
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.10.2-1
$(PKG)_x86_64_CS := 7da3ecaf2982dea24f9a8203f4f61890e909fac6
$(PKG)_i686_CS  := 0f5124b094599f71409261ecfeaea798ffef1962
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
