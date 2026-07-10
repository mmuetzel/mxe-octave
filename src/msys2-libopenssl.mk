# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libopenssl
$(PKG)_NAME     := libopenssl
$(PKG)_IGNORE   :=
$(PKG)_x86_64_VERSION  := 3.6.3-1
$(PKG)_x86_64_CS := a40e8a6f05dc6fa9278139657a7f09e424eb8896
$(PKG)_i686_VERSION  := 3.6.0-1
$(PKG)_i686_CS  := 056fef5cd989d648fe9e70821b5337fe4aa7648e
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
