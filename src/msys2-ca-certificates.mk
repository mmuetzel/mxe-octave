# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-ca-certificates
$(PKG)_NAME     := ca-certificates
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 20250419-1
$(PKG)_x86_64_CS := a5f8b4b9ef7473999f0a2f0a628df9c57e7b9704
$(PKG)_i686_CS  := 4f5c27259c3e1fee815a14df14e7eed9c2372ff6
$(PKG)_CS       := $($(PKG)_$(MSYS2_ARCH)_CS)
$(PKG)_CHECKSUM := $($(PKG)_CS)
$(PKG)_SUBDIR   := 
$(PKG)_FILE     := $($(PKG)_NAME)-$($(PKG)_VERSION)-$(MSYS2_ARCH).pkg.tar.zst
$(PKG)_URL      := $(MSYS2_URL)/$($(PKG)_NAME)-$($(PKG)_VERSION)-any.pkg.tar.zst
$(PKG)_URL_2     := $(if $(MSYS2_URL2),$(MSYS2_URL2)/$($(PKG)_FILE),)

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
