# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libpcre2
$(PKG)_NAME     := libpcre2_8
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 10.41-1
$(PKG)_x86_64_CS := 2cfbcc28eca8700c1c895a7e424a9f7572528e6b
$(PKG)_i686_CS  := f5b418886fb23633ce0799aa7b28772957de2872
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
