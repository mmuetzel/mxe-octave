# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-mpdecimal
$(PKG)_NAME     := mpdecimal
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.5.1-2
$(PKG)_x86_64_CS := 993b22e2ee9272078a063cae2007a2a75109fe51
$(PKG)_i686_CS  := 937d26a6c476cfd384b29a0067c8dd672ea3c4f8
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
