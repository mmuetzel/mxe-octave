# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libpcre
$(PKG)_NAME     := libpcre
$(PKG)_IGNORE   :=
$(PKG)_x86_64_VER := 8.45-5
$(PKG)_i686_VER  := 8.45-4
$(PKG)_VERSION  := $($(PKG)_$(MSYS2_ARCH)_VER)
$(PKG)_x86_64_CS := 6d4b1927611b606c0bcc6b4d8baabef1041c6ee1
$(PKG)_i686_CS  := 65f37c7f21bdba0407f3cdfb16d55697c7aacc1b
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
