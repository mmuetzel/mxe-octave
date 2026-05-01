# This file is part of MXE.
# See index.html for further information.

PKG             := opkg-parallel
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.0.2
$(PKG)_CHECKSUM := f680fbbfc4def0807a6f1e6684887fcf63b45cfc
$(PKG)_REMOTE_SUBDIR :=
$(PKG)_SUBDIR   := parallel-$($(PKG)_VERSION)
$(PKG)_FILE     := parallel-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := '$(OCTAVE_FORGE_BASE_URL)/$($(PKG)_FILE)/download'
$(PKG)_DEPS     :=

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
  $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

define $(PKG)_UPDATE
  $(OCTAVE_FORGE_PKG_UPDATE)
endef

define $(PKG)_BUILD
  cd $(1)/src && autoreconf -fiv
  $(call OCTAVE_FORGE_PKG_BUILD,$(1),$(2),$(3),$($(PKG)_OPTIONS))
endef
