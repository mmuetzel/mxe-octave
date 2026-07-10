# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-filesystem
$(PKG)_NAME     := filesystem
$(PKG)_IGNORE   :=
$(PKG)_x86_64_VERSION := 2026.03.06-1
$(PKG)_x86_64_CS := 25677b973658f79a6b9ea66aa4c98f52ead74202
$(PKG)_i686_VERSION  := 2025.05.08-2
$(PKG)_i686_CS  := ccd5240540d12ee14d6e9df93379ba183b2be2c6
$(PKG)_CS       := $($(PKG)_$(MSYS2_ARCH)_CS)
$(PKG)_CHECKSUM := $($(PKG)_CS)
$(PKG)_VERSION  := $($(PKG)_$(MSYS2_ARCH)_VERSION)
$(PKG)_SUBDIR   := 
$(PKG)_FILE     := $($(PKG)_NAME)-$($(PKG)_VERSION)-$(MSYS2_ARCH).pkg.tar.zst
$(PKG)_URL      := $(MSYS2_URL)/$($(PKG)_FILE)
$(PKG)_URL_2     := $(if $(MSYS2_URL2),$(MSYS2_URL2)/$($(PKG)_FILE),)

$(PKG)_DEPS     := 

define $(PKG)_UPDATE
    $(MSYS2_PKG_UPDATE)
endef

define $(PKG)_BUILD
    echo "# mount tmp to users profile temp dir" >> "$(1)/etc/fstab"
    echo "none /tmp usertemp binary,noacl,posix=0 0 0" >> "$(1)/etc/fstab"
    if [ "$(MSYS2_ARCH)" =  "i686" ]; then \
      $(SED) -i 's/\(.*refresh-keys.*\)/#\1/g' "$(1)/etc/post-install/07-pacman-key.post"; \
    fi
    $(MSYS2_PKG_BUILD)
endef
