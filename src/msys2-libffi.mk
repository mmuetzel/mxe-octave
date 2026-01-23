# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libffi
$(PKG)_NAME     := libffi
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.5.2-1
$(PKG)_x86_64_CS := 87e12a114f608a88624ba5bed82ba07a0fc50ac5
$(PKG)_i686_CS  := 0d37aac57390fb8f641616c56b65415f468db527
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
