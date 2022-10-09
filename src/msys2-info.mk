# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-info
$(PKG)_NAME     := info
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 6.8-4
$(PKG)_x86_64_CS := 5af9727157997467b8488174d4f27822fa9bde2e
$(PKG)_i686_CS  := 1a35f1eba5db64c35b38e88e16d0693baf731b37
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
