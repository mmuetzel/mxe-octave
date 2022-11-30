# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libcrypt
$(PKG)_NAME     := libcrypt
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.1-4
$(PKG)_x86_64_CS := 914c92b6fd282a20c64ce54bc3a992b0053327a2
$(PKG)_i686_CS  := 16793c6a7b96cdb30454d38d49d7f3ee2bfe8cad
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
