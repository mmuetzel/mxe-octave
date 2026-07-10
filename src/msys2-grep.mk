# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-grep
$(PKG)_NAME     := grep
$(PKG)_IGNORE   :=
$(PKG)_x86_64_VER := 1~3.0-7
$(PKG)_i686_VER  := 1.3.0-6
$(PKG)_VERSION  := $($(PKG)_$(MSYS2_ARCH)_VER)
$(PKG)_x86_64_CS := 9ccec4c66c2d3c7831c2c37bb4597d9a46dd02cd
$(PKG)_i686_CS  := 5cb218607654f8f6dc82e17e0c52a650b753bfbf
$(PKG)_CS       := $($(PKG)_$(MSYS2_ARCH)_CS)
$(PKG)_CHECKSUM := $($(PKG)_CS)
$(PKG)_SUBDIR   := 
$(PKG)_FILE     := $($(PKG)_NAME)-$($(PKG)_VERSION)-$(MSYS2_ARCH).pkg.tar.zst
$(PKG)_URL      := $(MSYS2_URL)/$($(PKG)_FILE)
$(PKG)_URL_2    := $(if $(MSYS2_URL2),$(MSYS2_URL2)/$($(PKG)_FILE),)

$(PKG)_DEPS     := 

define $(PKG)_UPDATE
    $(MSYS2_PKG_UPDATE)
endef

define $(PKG)_BUILD
    $(MSYS2_PKG_BUILD)
endef
