# This file is part of MXE.
# See index.html for further information.

PKG             := build-markupsafe
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.1.5
$(PKG)_CHECKSUM := 08593f9490b9be070aa2337e7311a392d33944dd
$(PKG)_SUBDIR   := MarkupSafe-$($(PKG)_VERSION)
$(PKG)_FILE     := MarkupSafe-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://files.pythonhosted.org/packages/87/5b/aae44c6655f3801e81aa3eef09dbbf012431987ba564d7231722f68df02d/$($(PKG)_FILE)
$(PKG)_DEPS     := build-python build-setuptools

define $(PKG)_UPDATE
    echo 'Warning: Updates are temporarily disabled for package $(PKG).' >&2;
    echo $($(PKG)_VERSION)
endef

define $(PKG)_BUILD
    cd '$(1)' && $(MXE_PYTHON) setup.py install --prefix='$(BUILD_TOOLS_PREFIX)'
endef

