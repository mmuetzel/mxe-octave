# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libexpat
$(PKG)_NAME     := libexpat
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.6.2-1
$(PKG)_x86_64_CS := 5b9029b29b3903cfa7823a77c39930510753a254
$(PKG)_i686_CS  := 7be9fd24092414b1cca0af9f293ff25c59ecde1f
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
