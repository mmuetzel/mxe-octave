# This file is part of MXE.
# See index.html for further information.

PKG             := build-python
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.8.13
$(PKG)_CHECKSUM := fb46587353f092d91caeddb07f82bb66a5115468
$(PKG)_SUBDIR   := Python-$($(PKG)_VERSION)
$(PKG)_FILE     := Python-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := http://www.python.org/ftp/python/$($(PKG)_VERSION)/$($(PKG)_FILE)

## For now, assume that libffi is installed on the build system.
$(PKG)_DEPS     := # build-libffi
ifneq ($(USE_SYSTEM_GCC),yes)
  $(PKG)_DEPS     += build-gcc
endif

define $(PKG)_UPDATE
  echo 'Warning: Updates are temporarily disabled for package $(PKG).' >&2;
  echo $($(PKG)_VERSION)
endef

define $(PKG)_BUILD
  mkdir '$(1)/.build'
  cd '$(1)/.build' && \
    PKG_CONFIG_PATH='$(BUILD_PKG_CONFIG_PATH)' \
    LD_LIBRARY_PATH='$(LD_LIBRARY_PATH)' \
    '$(1)/configure' \
      --prefix='$(BUILD_TOOLS_PREFIX)'

  $(MAKE) -C '$(1)/.build' -j '$(JOBS)'
  $(MAKE) -C '$(1)/.build' -j 1 install

  # install python3 as python
  ln -sf '$(BUILD_TOOLS_PREFIX)/bin/python3' '$(BUILD_TOOLS_PREFIX)/bin/python'
endef
