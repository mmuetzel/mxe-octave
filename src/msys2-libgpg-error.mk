# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libgpg-error
$(PKG)_NAME     := libgpg-error
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.42-1
$(PKG)_x86_64_CS := 0558048a188d8b9669f53881508195767962cfa2
$(PKG)_i686_CS  := c835b44bb7864b4df8b33021e80d0f4b19b33219
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
