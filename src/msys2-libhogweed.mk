# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libhogweed
$(PKG)_NAME     := libhogweed
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.9.1-1
$(PKG)_x86_64_CS := 009b24e3e83fb748b4ce1da8c407ae0d0481d68d
$(PKG)_i686_CS  := 8899aa121292ef6e6ffa381419c1c4e52330bbbf
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
