# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-zlib
$(PKG)_NAME     := zlib
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.3-1
$(PKG)_x86_64_CS := 021390c3fb8c338358535e8a59d7cf5a60e9f291
$(PKG)_i686_CS  := 130e436a31c1f4bb73c3056726d5679509e6a4a0
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
