# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libffi
$(PKG)_NAME     := libffi
$(PKG)_IGNORE   :=
$(PKG)_x86_64_VERSION  := 3.6.0-1
$(PKG)_x86_64_CS := b7ff26885072a5234afd4f8beb2b5d560d967247
$(PKG)_i686_VERSION  := 3.5.2-1
$(PKG)_i686_CS  := 0d37aac57390fb8f641616c56b65415f468db527
$(PKG)_CS       := $($(PKG)_$(MSYS2_ARCH)_CS)
$(PKG)_CHECKSUM := $($(PKG)_CS)
$(PKG)_VERSION  := $($(PKG)_$(MSYS2_ARCH)_VERSION)
$(PKG)_SUBDIR   := 
$(PKG)_FILE     := $($(PKG)_NAME)-$($(PKG)_VERSION)-$(MSYS2_ARCH).pkg.tar.zst
$(PKG)_URL      := $(MSYS2_URL)/$($(PKG)_FILE)
$(PKG)_URL_2    := $(if $(MSYS2_URL2),$(MSYS2_URL2)/$($(PKG)_FILE),)

$(PKG)_DEPS     := 

define $(PKG)_UPDATE
    $(MSYS2_PKG_UPDATE)
endef

define $(PKG)_BUILD
    $(MSYS2_PKG_BUILD)
endef
