# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-mintty
$(PKG)_NAME     := mintty
$(PKG)_IGNORE   :=
$(PKG)_x86_64_VER := 1~3.7.7-1
$(PKG)_i686_VER  := 1.3.7.7-1
$(PKG)_VERSION  := $($(PKG)_$(MSYS2_ARCH)_VER)
$(PKG)_FILTER   := mintty-1~
$(PKG)_x86_64_CS := 7a6118fbfb6c3942b727bc4be7dd29d6ded11358
$(PKG)_i686_CS  := 57e02b79c93bab3eb5c96c3128fbbc2a8900a926
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
