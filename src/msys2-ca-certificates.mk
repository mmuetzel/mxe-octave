# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-ca-certificates
$(PKG)_NAME     := ca-certificates
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 20240203-2
$(PKG)_x86_64_CS := 079fe41c097818e31612d60d4ade22e5d66af75d
$(PKG)_i686_CS  := 11e097002c3f943c603c97f2cfe242b8b6d84425
$(PKG)_CS       := $($(PKG)_$(MSYS2_ARCH)_CS)
$(PKG)_CHECKSUM := $($(PKG)_CS)
$(PKG)_SUBDIR   := 
$(PKG)_FILE     := $($(PKG)_NAME)-$($(PKG)_VERSION)-$(MSYS2_ARCH).pkg.tar.zst
$(PKG)_URL      := $(MSYS2_URL)/$($(PKG)_NAME)-$($(PKG)_VERSION)-any.pkg.tar.zst
$(PKG)_URL2     := $(if $(MSYS2_URL2),$(MSYS2_URL2)/$($(PKG)_FILE),)

$(PKG)_DEPS     := msys2-openssl

define $(PKG)_UPDATE
    $(MSYS2_PKG_UPDATE)
endef

define $(PKG)_BUILD
    # we need do create a post install for the certs
    mkdir -p "$(1)/etc/post-install"
    cat "$(1)/.INSTALL" > "$(1)/etc/post-install/07-ca-certificates.post"
    echo "" >> "$(1)/etc/post-install/07-ca-certificates.post"
    echo "if [ ! -d /etc/pacman.d/gnupg ]" >> "$(1)/etc/post-install/07-ca-certificates.post"
    echo "then" >> "$(1)/etc/post-install/07-ca-certificates.post"
    echo "  (cd / && post_install)" >> "$(1)/etc/post-install/07-ca-certificates.post"
    echo "fi" >> "$(1)/etc/post-install/07-ca-certificates.post"

    $(MSYS2_PKG_BUILD)
endef
