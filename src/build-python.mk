# This file is part of MXE.
# See index.html for further information.

PKG             := build-python
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.11.8
$(PKG)_CHECKSUM := a368aeed7a3325e47b55168452c356a8eb27ab50
$(PKG)_SUBDIR   := Python-$($(PKG)_VERSION)
$(PKG)_FILE     := Python-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := https://www.python.org/ftp/python/$($(PKG)_VERSION)/$($(PKG)_FILE)

## For now, assume that libffi is installed on the build system.
$(PKG)_DEPS     := # build-libffi
ifneq ($(MXE_SYSTEM)$(HOST_THREADS),mingwmcf)
  ## Need to use the system GCC when building for MinGW with MCF threading model
  ## to break a circular dependency for the MCF GThread library.
  ifneq ($(USE_SYSTEM_GCC),yes)
    $(PKG)_DEPS += build-gcc
  endif
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
