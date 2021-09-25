# This file is part of MXE.
# See index.html for further information.

PKG             := build-markupsafe
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.0.1
$(PKG)_CHECKSUM := e1b766b2b1601fde67b3b19ed2f13b9746bb1cca
$(PKG)_SUBDIR   := MarkupSafe-$($(PKG)_VERSION)
$(PKG)_FILE     := MarkupSafe-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://files.pythonhosted.org/packages/bf/10/ff66fea6d1788c458663a84d88787bae15d45daa16f6b3ef33322a51fc7e/$($(PKG)_FILE)
$(PKG)_DEPS     := build-python build-setuptools

define $(PKG)_UPDATE
    echo 'Warning: Updates are temporarily disabled for package $(PKG).' >&2;
    echo $($(PKG)_VERSION)
endef

define $(PKG)_BUILD
    cd '$(1)' && $(MXE_PYTHON) setup.py install --prefix='$(BUILD_TOOLS_PREFIX)'
endef

