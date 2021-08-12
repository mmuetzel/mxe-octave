# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libnettle
$(PKG)_NAME     := libnettle
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.7.3-1
$(PKG)_x86_64_CS := bd57cd803522a7c74e26f2af6d445f8d1f5557ad
$(PKG)_i686_CS  := cb5639908c639b22bee80f0cc140c3be8f8d93b8
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
