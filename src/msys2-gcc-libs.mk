# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-gcc-libs
$(PKG)_NAME     := gcc-libs
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 10.2.0-1
$(PKG)_x86_64_CS := 33a43d91c18ab91a0ea61049005309d6351ebe3a
$(PKG)_i686_CS  := e4286aa812cf926c72df061cb5100e9424c81857
$(PKG)_CS       := $($(PKG)_$(MSYS2_ARCH)_CS)
$(PKG)_CHECKSUM := $($(PKG)_CS)
$(PKG)_SUBDIR   := 
$(PKG)_FILE     := $($(PKG)_NAME)-$($(PKG)_VERSION)-$(MSYS2_ARCH).pkg.tar.zst
$(PKG)_URL      := $(MSYS2_URL)/$($(PKG)_FILE)

$(PKG)_DEPS     := 

define $(PKG)_UPDATE
    $(MSYS2_PKG_UPDATE)
endef

define $(PKG)_BUILD
    $(MSYS2_PKG_BUILD)
endef
