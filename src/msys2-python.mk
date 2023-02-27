# This file is part of MXE.
# See index.html for further information.

PKG             := msys2-python
$(PKG)_NAME     := python
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.11.2-1
$(PKG)_x86_64_CS := e81e63b0e0f47178102de26d8b857f6721fb3a7a
$(PKG)_i686_CS  := 1bb5f2823c45fc92b1f8e8e5be9d497f108b5d03
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
