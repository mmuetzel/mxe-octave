# This file is part of MXE.
# See index.html for further information.

PKG             := build-setuptools
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 69.2.0
$(PKG)_CHECKSUM := aebbbea52c78c80628559decae0cff7046a7f91d
$(PKG)_SUBDIR   := setuptools-$($(PKG)_VERSION)
$(PKG)_FILE     := setuptools-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://files.pythonhosted.org/packages/4d/5b/dc575711b6b8f2f866131a40d053e30e962e633b332acf7cd2c24843d83d/$($(PKG)_FILE)
$(PKG)_DEPS     := build-python

define $(PKG)_UPDATE
    echo 'Warning: Updates are temporarily disabled for package $(PKG).' >&2;
    echo $($(PKG)_VERSION)
endef

define $(PKG)_BUILD
    cd '$(1)' && $(MXE_PYTHON) setup.py install --prefix='$(BUILD_TOOLS_PREFIX)'
endef
