# This file is part of MXE.
# See index.html for further information.

PKG             := build-setuptools
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 56.2.0
$(PKG)_CHECKSUM := 93a2efe727c901cd140fad483b5e05d5f8117ec2
$(PKG)_SUBDIR   := setuptools-$($(PKG)_VERSION)
$(PKG)_FILE     := setuptools-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://files.pythonhosted.org/packages/fc/0a/b486efab52f8ad03c3eca0c998dd3deafba0c39b29e0c49c68a7152c8b2d/$($(PKG)_FILE)
$(PKG)_DEPS     := build-python

define $(PKG)_UPDATE
    echo 'Warning: Updates are temporarily disabled for package $(PKG).' >&2;
    echo $($(PKG)_VERSION)
endef

define $(PKG)_BUILD
    cd '$(1)' && $(MXE_PYTHON) setup.py install --prefix='$(BUILD_TOOLS_PREFIX)'
endef
