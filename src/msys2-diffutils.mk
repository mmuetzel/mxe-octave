# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-diffutils
$(PKG)_NAME     := diffutils
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.9-1
$(PKG)_x86_64_CS := f1d3c4322ee39bdc9a00393c146d42e280e1613a
$(PKG)_i686_CS  := 2ba614d2322a2037f6c79f726226c7c190e5340a
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
