# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-gmp
$(PKG)_NAME     := gmp
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 6.3.0-2
$(PKG)_x86_64_CS := ce6b2ef771732d9f05a84b7b5cd5cdd9d1114f9f
$(PKG)_i686_CS  := a287040a8f557d1ee152312a6a3cc03bbb56d890
$(PKG)_CS       := $($(PKG)_$(MSYS2_ARCH)_CS)
$(PKG)_CHECKSUM := $($(PKG)_CS)
$(PKG)_SUBDIR   :=
$(PKG)_FILE     := $($(PKG)_NAME)-$($(PKG)_VERSION)-$(MSYS2_ARCH).pkg.tar.zst
$(PKG)_URL      := $(MSYS2_URL)/$($(PKG)_FILE)
$(PKG)_URL_2    := $(if $(MSYS2_URL2),$(MSYS2_URL2)/$($(PKG)_FILE),)

$(PKG)_DEPS     :=

define $(PKG)_UPDATE
    $(MSYS2_PKG_UPDATE)
endef

define $(PKG)_BUILD
    $(MSYS2_PKG_BUILD)
endef
