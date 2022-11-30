# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libhogweed
$(PKG)_NAME     := libhogweed
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.8.1-1
$(PKG)_x86_64_CS := 8f1ac0e6cf38977b9346c68b332fe03dacad8664
$(PKG)_i686_CS  := de0e5edabea456bfee70701705aaf6d324b5ab9b
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
