# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-ca-certificates
$(PKG)_NAME     := ca-certificates
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 20211016-2
$(PKG)_x86_64_CS := fa44882c856f1f96735c9ae2021eee2a3dc44efe
$(PKG)_i686_CS  := cae6ae719a006b7d06fc0f86eb41ee6f99865baa
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
