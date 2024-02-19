# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-liblzma
$(PKG)_NAME     := liblzma
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 5.4.6-2
$(PKG)_x86_64_CS := 04df9c7ee7e9092bdda1ebdd8a58415ac2c78636
$(PKG)_i686_CS  := 1eb1ee06f3bdb7b6cbd1f5e8a6df25ee93ad3b85
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
