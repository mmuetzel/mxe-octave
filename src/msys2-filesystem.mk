# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-filesystem
$(PKG)_NAME     := filesystem
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2023.02.07-1
$(PKG)_x86_64_CS := ec28b755f2c794451e39daab401aef2964dad8f3
$(PKG)_i686_CS  := 89a23b0a3a5c745ab507989b5f2f7b5286085272
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
    echo "# mount tmp to users profile temp dir" >> "$(1)/etc/fstab"
    echo "none /tmp usertemp binary,noacl,posix=0 0 0" >> "$(1)/etc/fstab"
    if [ "$(MSYS2_ARCH)" =  "i686" ]; then \
      $(SED) -i 's/\(.*refresh-keys.*\)/#\1/g' "$(1)/etc/post-install/07-pacman-key.post"; \
    fi
    $(MSYS2_PKG_BUILD)
endef
