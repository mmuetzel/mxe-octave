# This file is part of MXE.
# See index.html for further information.

PKG             := of-queueing
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.2.8
$(PKG)_CHECKSUM := 6d7677d7d0807023e58d91da6683d37f50d48b0f
$(PKG)_REMOTE_SUBDIR := 
$(PKG)_SUBDIR   := queueing
$(PKG)_FILE     := queueing-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/mmarzolla/queueing/releases/download/$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_DEPS     := 

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
    $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

define $(PKG)_UPDATE
    $(OCTAVE_FORGE_PKG_UPDATE)
endef

define $(PKG)_BUILD
    $(OCTAVE_FORGE_PKG_BUILD)
endef
