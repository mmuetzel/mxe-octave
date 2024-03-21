# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-python
$(PKG)_NAME     := python
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.11.8-1
$(PKG)_x86_64_CS := eac4b3e6a70c884abb19e2d3839f632e892505ac
$(PKG)_i686_CS  := f4baf049dc3d6a78fd002223b34a01fc70dd1fcb
$(PKG)_CS       := $($(PKG)_$(MSYS2_ARCH)_CS)
$(PKG)_CHECKSUM := $($(PKG)_CS)
$(PKG)_SUBDIR   := 
$(PKG)_FILE     := $($(PKG)_NAME)-$($(PKG)_VERSION)-$(MSYS2_ARCH).pkg.tar.zst
$(PKG)_URL      := $(MSYS2_URL)/$($(PKG)_FILE)
$(PKG)_URL2     := $(if $(MSYS2_URL2),$(MSYS2_URL2)/$($(PKG)_FILE),)

$(PKG)_DEPS     := 

$(PKG)_PYTHON_PKG_DIR := $(MSYS2_DIR)/usr/lib/python$(call SHORT_PKG_VERSION,msys2-python)

define $(PKG)_UPDATE
    $(MSYS2_PKG_UPDATE)
endef

define $(PKG)_BUILD
    $(MSYS2_PKG_BUILD)
    if [ "$(ENABLE_WINDOWS_64)" == "no" ]; then \
      rm -f "$($(PKG)_PYTHON_PKG_DIR)/distutils/command/"wininst*-amd64.exe; \
    fi
endef
