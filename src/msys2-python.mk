# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-python
$(PKG)_NAME     := python
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.11.4-3
$(PKG)_x86_64_CS := 1abe7f751c1ab37d30c13ec3c2bf8e25df53da8b
$(PKG)_i686_CS  := 17e0a0f0f70cd04316376b2f4f2191449723462b
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
