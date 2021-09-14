# This file is part of MXE.
# See index.html for further information.

PKG             := python-mpmath
$(PKG)_VERSION  := 1.2.1
$(PKG)_CHECKSUM := ce8bd24606eeb02218b26304e6d99228919021f8
$(PKG)_SUBDIR   := 
$(PKG)_FILE     := mpmath-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://files.pythonhosted.org/packages/95/ba/7384cb4db4ed474d4582944053549e02ec25da630810e4a23454bc9fa617/$($(PKG)_FILE)
$(PKG)_DEPS     :=

ifeq ($(MXE_WINDOWS_BUILD),yes)
 $(PKG)_DEPS += msys2-python
 $(PKG)_PYTHON_PKG_DIR := $(MSYS2_DIR)/usr/lib/python$(call SHORT_PKG_VERSION,msys2-python)/site-packages/
else
 $(PKG)_PYTHON_PKG_DIR := $(3)$(HOST_PREFIX)/python
endif

define $(PKG)_UPDATE
    echo $($(PKG)_VERSION)
endef

define $(PKG)_BUILD
    mkdir -p '$($(PKG)_PYTHON_PKG_DIR)'
    cd '$(1)/mpmath-$($(PKG)_VERSION)' && tar cf - mpmath | ( cd '$($(PKG)_PYTHON_PKG_DIR)'; tar xpf - )
    cd '$(1)' && tar cf - --exclude=mpmath-$($(PKG)_VERSION)/mpmath . | ( cd '$($(PKG)_PYTHON_PKG_DIR)'; tar xpf - )
endef
