# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libidn2
$(PKG)_NAME     := libidn2
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.3.3-1
$(PKG)_x86_64_CS := 1e2f727c485c6121cbae2c1e56c804d6bd5185de
$(PKG)_i686_CS  := ecf8e6a917683102205dfa15fbb6cb043d88ffbf
$(PKG)_CS       := $($(PKG)_$(MSYS2_ARCH)_CS)
$(PKG)_CHECKSUM := $($(PKG)_CS)
$(PKG)_SUBDIR   := 
$(PKG)_FILE     := $($(PKG)_NAME)-$($(PKG)_VERSION)-$(MSYS2_ARCH).pkg.tar.zst
$(PKG)_URL      := $(MSYS2_URL)/$($(PKG)_FILE)
$(PKG)_URL2     := $(if $(MSYS2_URL2),$(MSYS2_URL2)/$($(PKG)_FILE),)

#https://sourceforge.net/projects/msys2/files/REPOS/MSYS2/x86_64/bash-4.4.019-3-x86_64.pkg.tar.xz

$(PKG)_DEPS     := 

define $(PKG)_UPDATE
    $(MSYS2_PKG_UPDATE)
endef

define $(PKG)_BUILD
    $(MSYS2_PKG_BUILD)
endef
