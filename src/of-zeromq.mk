# This file is part of MXE.
# See index.html for further information.

PKG             := of-zeromq
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.5.8
$(PKG)_CHECKSUM := b0809da419d5aacc4adc77a026f4f29d13cd69f1
$(PKG)_REMOTE_SUBDIR := 
$(PKG)_SUBDIR   := zeromq-$($(PKG)_VERSION)
$(PKG)_FILE     := zeromq-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/gnu-octave/octave-zeromq/releases/download/release-$($(PKG)_VERSION)/$($(PKG)_SUBDIR).tar.gz
$(PKG)_DEPS     := zeromq

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
  $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

define $(PKG)_UPDATE
  $(call GITHUB_PKG_UPDATE,gnu-octave,octave-zeromq,release-)
endef

define $(PKG)_BUILD
  cd $(1)/src && autoreconf -fiv
  $(OCTAVE_FORGE_PKG_BUILD)
endef
