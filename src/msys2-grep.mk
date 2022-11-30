# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-grep
$(PKG)_NAME     := grep
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.6-1
$(PKG)_x86_64_CS := e0a4116c894bd01f41cb28de064127108ddf3aff
$(PKG)_i686_CS  := 6ad5a97ac3f224fddbc5636f4b69c0650a2f7635
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
