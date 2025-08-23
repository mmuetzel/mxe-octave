# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libpcre2
$(PKG)_NAME     := libpcre2_8
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 10.45-1
$(PKG)_x86_64_CS := 6ed3b2c62e97223af7d9bfb25755afff1218aa04
$(PKG)_i686_CS  := da4d4dd55f5e3c4e5bdd3189cc57b124e723f995
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
