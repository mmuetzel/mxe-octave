# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-wget
$(PKG)_NAME     := wget
$(PKG)_IGNORE   :=
$(PKG)_x86_64_VERSION  := 1.25.0-2
$(PKG)_x86_64_CS := fb2964930088ef17b432af3a58d3c7b357dd2680
 $(PKG)_IGNORE   :=
$(PKG)_i686_VERSION  := 1.25.0-1
$(PKG)_i686_CS  := 2e321a52cfc592f076c85407f64c16fd6024c316
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
