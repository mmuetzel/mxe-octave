# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libnpth
$(PKG)_NAME     := libnpth
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.6-2
$(PKG)_x86_64_CS := 0ee21116b6bdb5b7af098284fdb762cae50d2833
$(PKG)_i686_CS  := 37e187b73f80d87055de3710350ac76aa4c42f63
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
