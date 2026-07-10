# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-make
$(PKG)_NAME     := make
$(PKG)_IGNORE   :=
$(PKG)_x86_64_VERSION  := 4.4.1-3
$(PKG)_x86_64_CS := 983ca7d45b16c8096f17e928a90368f7cb573eff
$(PKG)_i686_VERSION  := 4.4.1-2
$(PKG)_i686_CS  := 60489cc1fdb861bf3ad7250babc52689e092ef3a
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
