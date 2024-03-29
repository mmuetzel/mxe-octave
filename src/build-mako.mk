# This file is part of MXE.
# See index.html for further information.

PKG             := build-mako
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.3.2
$(PKG)_CHECKSUM := 9db26e15daa51fe0138b0eab100ecc09f5e86d0a
$(PKG)_SUBDIR   := Mako-$($(PKG)_VERSION)
$(PKG)_FILE     := Mako-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://pypi.python.org/packages/d4/1b/71434d9fa9be1ac1bc6fb5f54b9d41233be2969f16be759766208f49f072/$($(PKG)_FILE)
$(PKG)_DEPS     := build-python build-markupsafe

define $(PKG)_UPDATE
    echo 'Warning: Updates are temporarily disabled for package $(PKG).' >&2;
    echo $($(PKG)_VERSION)
endef

define $(PKG)_BUILD
    cd '$(1)' && $(MXE_PYTHON) setup.py install --prefix='$(BUILD_TOOLS_PREFIX)'
endef
