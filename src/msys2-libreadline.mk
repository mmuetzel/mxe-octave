# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libreadline
$(PKG)_NAME     := libreadline
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 8.2.001-3
$(PKG)_x86_64_CS := 8bad2ef937d2f2e2a7f1a9c556a2d3dc49599a5a
$(PKG)_i686_CS  := bb1590bc37f91398b50410a10ac656ceaf109fa2
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
    $(MSYS2_PKG_BUILD)
endef
