# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-gzip
$(PKG)_NAME     := gzip
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.13-1
$(PKG)_x86_64_CS := 3665e6d001de2ce2060b5109078edad3e2f9dfb4
$(PKG)_i686_CS  := 55d2221d7833d5ed7d4ff4f47865e7d443b11e38
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
