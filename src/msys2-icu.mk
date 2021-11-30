# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-icu
$(PKG)_NAME     := icu
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 68.2-1
$(PKG)_x86_64_CS := 280b019c2f812158c312341daff046f95903393d
$(PKG)_i686_CS  := 9ef9a030f9b5c34733b96a7be116bf6fa63fd724
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
