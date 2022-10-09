# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-python
$(PKG)_NAME     := python
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.10.6-1
$(PKG)_x86_64_CS := 3ac7b040a22755c2c6ad9373d10a5488b752413e
$(PKG)_i686_CS  := 08f9c0baabb12a8275129d946732d798c57e509f
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
