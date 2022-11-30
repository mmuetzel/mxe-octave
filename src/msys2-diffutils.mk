# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-diffutils
$(PKG)_NAME     := diffutils
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.8-3
$(PKG)_x86_64_CS := a838ab6e638ab102dac647800c0f8f796c70c342
$(PKG)_i686_CS  := b486290b5f2a0d8d5dbe8273e7a8e25edad437a9
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
