# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-libxslt
$(PKG)_NAME     := libxslt
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.1.34-4
$(PKG)_x86_64_CS := f3aa2f91122503d31be5ed64a7c3ed34eda349bf
$(PKG)_i686_CS  := 536dcc352aa259df8191262cdbc75de4a24069fc
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
