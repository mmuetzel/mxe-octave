# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-liblzma
$(PKG)_NAME     := liblzma
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 5.4.2-1
$(PKG)_x86_64_CS := 7cfc4063663619a1d0b1c9637abf6ae4ac970bc2
$(PKG)_i686_CS  := 4395066702d658b7cbec6f338b0a1cb924ff97db
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
