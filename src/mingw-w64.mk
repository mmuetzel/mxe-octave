# This file is part of MXE.
# See index.html for further information.

PKG             := mingw-w64
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 14.0.0
$(PKG)_CHECKSUM := d698cffabe268e192ca2164b6370ed3ae7a16c66
$(PKG)_SUBDIR   := $(PKG)-v$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-v$($(PKG)_VERSION).tar.bz2
$(PKG)_URL      := http://$(SOURCEFORGE_MIRROR)/project/$(PKG)/$(PKG)/$(PKG)-release/$($(PKG)_FILE)
$(PKG)_DEPS     :=

define $(PKG)_UPDATE
  $(WGET) -q -O- 'http://sourceforge.net/projects/mingw-w64/files/mingw-w64/mingw-w64-release/' | \
  $(SED) -n 's,.*mingw-w64-v\([0-9.]*\)\.tar.*,\1,p' | \
  $(SORT) -V | \
  tail -1
endef

$(PKG)_WINAPI_VERSION_FLAGS := --with-default-win32-winnt=0x0601

ifneq ($(HOST_MSVCRT),msvcrt)
  $(PKG)_DEFAULT_MSVCRT := --with-default-msvcrt=ucrt
else
  $(PKG)_DEFAULT_MSVCRT := --with-default-msvcrt=msvcrt
endif

define $(PKG)_BUILD
  mkdir '$(1).headers-build'
  cd '$(1).headers-build' && '$(1)/mingw-w64-headers/configure' \
    --host='$(TARGET)' \
    --prefix='$(HOST_PREFIX)' \
    --enable-sdk=all \
    --enable-idl \
    --enable-secure-api \
    $($(PKG)_WINAPI_VERSION_FLAGS) \
    $($(PKG)_DEFAULT_MSVCRT)

  $(MAKE) -C '$(1).headers-build' install
endef
