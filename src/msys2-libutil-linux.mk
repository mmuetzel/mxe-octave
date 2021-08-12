# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libutil-linux
$(PKG)_NAME     := libutil-linux
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.35.2-1
$(PKG)_x86_64_CS := a954a605386c24309f251c64a8d4e5d490355350
$(PKG)_i686_CS  := 199ffb8d40f76f89e33bb0f04d4323f6db982b5f
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
