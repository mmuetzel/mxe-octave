# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libgpgme
$(PKG)_NAME     := libgpgme
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.20.0-1
$(PKG)_x86_64_CS := c6f8fc9bd126f07add3c5b345325006c7e6ed0cc
$(PKG)_i686_CS  := fc1629af1b2af11c5493393741ef80b3ae032e5e
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
