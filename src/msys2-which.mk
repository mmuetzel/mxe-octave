# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-which
$(PKG)_NAME     := which
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.21-4
$(PKG)_x86_64_CS := 5066769f77b22f80ede00838938c0319b597c6db
$(PKG)_i686_CS  := 3b28bb0f947b2895665443168c942364e67b2d24
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
