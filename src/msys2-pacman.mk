# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-pacman
$(PKG)_NAME     := pacman
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 6.0.2-11
$(PKG)_x86_64_CS := 14c999ae34318f05e1be3839e3016a8863b0f001
$(PKG)_i686_CS  := 674e5b21a1fdf207ee6cbcbb57a21dbafa91b452
$(PKG)_CS       := $($(PKG)_$(MSYS2_ARCH)_CS)
$(PKG)_CHECKSUM := $($(PKG)_CS)
$(PKG)_SUBDIR   := 
$(PKG)_FILE     := $($(PKG)_NAME)-$($(PKG)_VERSION)-$(MSYS2_ARCH).pkg.tar.zst
$(PKG)_URL      := $(MSYS2_URL)/$($(PKG)_FILE)
$(PKG)_URL2     := $(if $(MSYS2_URL2),$(MSYS2_URL2)/$($(PKG)_FILE),)

$(PKG)_DEPS     := msys2-pacman-mirrors msys2-keyring msys2-gnupg

define $(PKG)_UPDATE
    $(MSYS2_PKG_UPDATE)
endef

define $(PKG)_BUILD
    if [ "$(MSYS2_ARCH)" =  "i686" ]; then \
      $(SED) -i '/^\[msys\]/i \[build32\]\nServer = $(MSYS2_URL)\nSigLevel = Optional\n' "$(1)/etc/pacman.conf"; \
    fi
    $(MSYS2_PKG_BUILD)
endef
