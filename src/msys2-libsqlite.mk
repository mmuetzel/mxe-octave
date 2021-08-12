# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libsqlite
$(PKG)_NAME     := libsqlite
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.36.0-1
$(PKG)_x86_64_CS := 3433a6a55df9faf128f644c7ff61cc8f14237936
$(PKG)_i686_CS  := b928e6560c8b833d448dd3b814ffd14f66b80702
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
