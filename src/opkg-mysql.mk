# This file is part of MXE.
# See index.html for further information.

PKG             := opkg-mysql
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.0.1
$(PKG)_CHECKSUM := 48ea7e10488f685b558edc12ed3fd8bfff8e6220
$(PKG)_SUBDIR   := octave-mysql-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_SUBDIR).tar.gz
$(PKG)_URL      := https://github.com/gnu-octave/octave-mysql/releases/download/v$($(PKG)_VERSION)/$($(PKG)_SUBDIR).tar.gz
$(PKG)_DEPS     := mariadb-connector-c

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
  $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

define $(PKG)_UPDATE
  $(call GITHUB_PKG_UPDATE,gnu-octave,octave-mysql,v)
endef

define $(PKG)_BUILD
  $(OCTAVE_FORGE_PKG_BUILD)
endef
