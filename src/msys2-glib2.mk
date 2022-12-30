# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-glib2
$(PKG)_NAME     := glib2
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.74.3-1
$(PKG)_x86_64_CS := 150648859fff6eb3a1ce3fc9b1e98c106a6ec088
$(PKG)_i686_CS  := 5b33ba2e8c0e1790636a57f00a890ed257a2f1ee
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
