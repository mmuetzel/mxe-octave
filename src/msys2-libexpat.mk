# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libexpat
$(PKG)_NAME     := libexpat
$(PKG)_IGNORE   :=
$(PKG)_x86_64_VERSION  := 2.8.2-1
$(PKG)_x86_64_CS := c8590c349589e6ebc2dd11bb6abed744d867ceb7
$(PKG)_i686_VERSION  := 2.7.3-1
$(PKG)_i686_CS  := ab8c363538e8e3f8b8d7910cdd4842399c81d6c0
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
