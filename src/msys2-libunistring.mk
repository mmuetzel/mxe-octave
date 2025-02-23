# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libunistring
$(PKG)_NAME     := libunistring
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.2-1
$(PKG)_x86_64_CS := e51111c029eb6fe5656f77697eb07911c6d6f952
$(PKG)_i686_CS  := 856f2146ee9e7cb0d3c0347ecd422ce74c87737f
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
