# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-filesystem
$(PKG)_NAME     := filesystem
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2021.06-1
$(PKG)_x86_64_CS := 119b065c17f0243e91786c5ae4c33f94f70bafed
$(PKG)_i686_CS  := c2139a15abb3c9153201f0f79e6638298f2d65ee
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
    echo "# mount tmp to users profile temp dir" >> "$(1)/etc/fstab"
    echo "none /tmp usertemp binary,posix=0 0 0" >> "$(1)/etc/fstab"
    $(MSYS2_PKG_BUILD)
endef
