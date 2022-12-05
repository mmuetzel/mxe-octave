# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libpsl
$(PKG)_NAME     := libpsl
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.21.1-5
$(PKG)_x86_64_CS := a26c71e38c3a2af3b59d3967fb4e8dd8b080eef7
$(PKG)_i686_CS  := 163f937bf58ca343162a9366d2f689f762535ca8
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
