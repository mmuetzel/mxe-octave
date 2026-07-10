# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-which
$(PKG)_NAME     := which
$(PKG)_IGNORE   :=
$(PKG)_x86_64_VERSION  := 2.25-1
$(PKG)_x86_64_CS := 0ac4ab2bd32c753a1bde4a15b369976a35c66919
$(PKG)_i686_VERSION  := 2.23-4
$(PKG)_i686_CS  := ec90f1dd4b21eb2a9760a4aa29f6b39778ad795f
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
