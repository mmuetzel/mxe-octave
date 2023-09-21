# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libgnutls
$(PKG)_NAME     := libgnutls
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.8.1-2
$(PKG)_x86_64_CS := e87a79d6c345401c1220060079a0a07394282f51
$(PKG)_i686_CS  := 7dadc01a792ed02cad2e980c438c8799cb71bf75
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
