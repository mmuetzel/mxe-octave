# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-pacman
$(PKG)_NAME     := pacman
$(PKG)_IGNORE   :=
$(PKG)_x86_64_VER := 6.1.0-21
$(PKG)_i686_VER  := 6.1.0-18
$(PKG)_x86_64_CS := 5e7942e0666f2b56cc01a7c146635de2d99f9db5
$(PKG)_i686_CS  := e2fa556ef7b87e4ba179e31006028555a3e90a36
$(PKG)_VERSION  := $($(PKG)_$(MSYS2_ARCH)_VER)
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
