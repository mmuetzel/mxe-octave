# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libpcre
$(PKG)_NAME     := libpcre
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 8.45-3
$(PKG)_x86_64_CS := a959727252343ab046f25b3783118343c5f9866a
$(PKG)_i686_CS  := 7fe940169f5ae4fb8471d2c1a3a3b97c9506833f
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
