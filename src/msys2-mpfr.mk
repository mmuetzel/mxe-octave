# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-mpfr
$(PKG)_NAME     := mpfr
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.2.1-1
$(PKG)_x86_64_CS := dae4a025e8befb7808dffb47288ad7c15da1753e
$(PKG)_i686_CS  := 1ba49bb401d6bed8ae0b6fd9bb07fd13d3ce5d4c
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
