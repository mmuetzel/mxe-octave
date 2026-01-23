# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libutil-linux
$(PKG)_NAME     := libutil-linux
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.40.2-2
$(PKG)_x86_64_CS := 47ba9d34915edca5e56166fbd7c48b0b523df9f3
$(PKG)_i686_CS  := 1d1e9b39923b2b15758ae969fe3ec250f2ba0385
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
