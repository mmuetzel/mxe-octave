# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libcrypt
$(PKG)_NAME     := libcrypt
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.1-5
$(PKG)_x86_64_CS := 995cd1c548efaa996bf400c9f448c944226e08fb
$(PKG)_i686_CS  := 96482b1353db9ecb5f019c80bca03b24b1d601f6
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
