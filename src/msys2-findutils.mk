# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-findutils
$(PKG)_NAME     := findutils
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.8.0-1
$(PKG)_x86_64_CS := 4808ef0e69657f1ad08724b16d424b26d0a92f8f
$(PKG)_i686_CS  := 08773c5243becd6f4b852fb56e807d7ab6cfff27
$(PKG)_CS       := $($(PKG)_$(MSYS2_ARCH)_CS)
$(PKG)_CHECKSUM := $($(PKG)_CS)
$(PKG)_SUBDIR   := 
$(PKG)_FILE     := $($(PKG)_NAME)-$($(PKG)_VERSION)-$(MSYS2_ARCH).pkg.tar.zst
$(PKG)_URL      := $(MSYS2_URL)/$($(PKG)_FILE)

$(PKG)_DEPS     := 

define $(PKG)_UPDATE
    $(MSYS2_PKG_UPDATE)
endef

define $(PKG)_BUILD
    $(MSYS2_PKG_BUILD)
endef
