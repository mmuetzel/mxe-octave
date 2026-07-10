# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libiconv
$(PKG)_NAME     := libiconv
$(PKG)_IGNORE   :=
$(PKG)_x86_64_VERSION  := 1.19-1
$(PKG)_x86_64_CS := 596051503a1e7d016652fb2d646dcfe117f86cbe
$(PKG)_i686_VERSION  := 1.18-1
$(PKG)_i686_CS  := 0b02fbf1db453a542cac67304951696df5150836
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
