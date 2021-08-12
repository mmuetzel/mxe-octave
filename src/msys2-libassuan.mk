# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libassuan
$(PKG)_NAME     := libassuan
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.5.5-1
$(PKG)_x86_64_CS := 3b2e23b33eaeee3f06c046db1f0c5a7b22e0700e
$(PKG)_i686_CS  := 942d543c45502515bbb407667daf7ad9f2b8699e
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
