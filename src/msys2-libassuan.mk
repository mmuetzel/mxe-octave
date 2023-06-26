# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libassuan
$(PKG)_NAME     := libassuan
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.5.6-1
$(PKG)_x86_64_CS := dadf38e6ef3a6583e5aff601e77996c389ec2123
$(PKG)_i686_CS  := 4b801e56a62ee2ef339dda565ff36f1728c8ba4b
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
