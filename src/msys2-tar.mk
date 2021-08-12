# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-tar
$(PKG)_NAME     := tar
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.34-1
$(PKG)_x86_64_CS := b5adc14cc4e5ebcdc3f5c4ae0b3df3e2de844487
$(PKG)_i686_CS  := d3281a465b593e55eb6cc8f58517d3098c024318
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
