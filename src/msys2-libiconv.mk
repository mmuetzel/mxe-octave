# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libiconv
$(PKG)_NAME     := libiconv
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.16-2
$(PKG)_x86_64_CS := d4fdeb0648bcae7006185af4dca59dbdb1c003eb
$(PKG)_i686_CS  := 90db540078910c062abc39007206416619e001d4
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
