# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-pacman
$(PKG)_NAME     := pacman
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 6.0.1-32
$(PKG)_x86_64_CS := 9440b758e31a9daa41a4d1d8f9b0e55e0782448c
$(PKG)_i686_CS  := 75f757125768588524d3cf65e3d501cfe0bc5d5c
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
