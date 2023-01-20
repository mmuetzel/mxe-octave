# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-mpfr
$(PKG)_NAME     := mpfr
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.2.0-2
$(PKG)_x86_64_CS := a14e908cef8722aa800b1390be7ccd83483c137f
$(PKG)_i686_CS  := dd413836de633d05d3bde3e692bb237468ed338d
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
