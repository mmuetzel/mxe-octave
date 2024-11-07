# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libhogweed
$(PKG)_NAME     := libhogweed
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.10-1
$(PKG)_x86_64_CS := d60ff1c6bac62bc8ed24445fe2985597b6fa1035
$(PKG)_i686_CS  := f244a09a2f083ba7c1bc6b8319a57204ccb3cea3
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
