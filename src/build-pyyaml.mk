# This file is part of MXE.
# See index.html for further information.

PKG             := build-pyyaml
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 6.0.2
$(PKG)_CHECKSUM := 28ff04429be8b54e1e73a7349b5e36034295cf5e
$(PKG)_SUBDIR   := pyyaml-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_SUBDIR).tar.gz
$(PKG)_URL      := https://files.pythonhosted.org/packages/54/ed/79a089b6be93607fa5cdaedf301d7dfb23af5f25c398d5ead2525b063e17/$($(PKG)_FILE)
$(PKG)_DEPS     := build-python

define $(PKG)_UPDATE
    echo 'Warning: Updates are temporarily disabled for package $(PKG).' >&2;
    echo $($(PKG)_VERSION)
    head -1
endef

define $(PKG)_BUILD
    cd '$(1)' && $(MXE_PYTHON) setup.py install --prefix='$(BUILD_TOOLS_PREFIX)'
endef
