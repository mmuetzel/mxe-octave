# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libiconv
$(PKG)_NAME     := libiconv
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.17-1
$(PKG)_x86_64_CS := 36f85ae203224ad4746c6ebb6c07e8b397db2aff
$(PKG)_i686_CS  := da2069f8c0e4e330634d0807219583377a1cd53f
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
