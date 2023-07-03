# This file is part of MXE.
# See index.html for further information.

PKG             := of-stk
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.8.1
$(PKG)_CHECKSUM := 125dcf45346c408222cdcc60cd5f257b544dbe53
$(PKG)_REMOTE_SUBDIR := 
$(PKG)_SUBDIR   := stk
$(PKG)_FILE     := stk-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := '$(OCTAVE_FORGE_BASE_URL)/$($(PKG)_FILE)/download'
$(PKG)_URL      := https://github.com/stk-kriging/stk/releases/download/$($(PKG)_VERSION)/stk-$($(PKG)_VERSION)-octpkg.tar.gz
$(PKG)_DEPS     := 
https://github.com/stk-kriging/stk

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
    $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,stk-kriging,stk,)
endef

define $(PKG)_BUILD
    $(OCTAVE_FORGE_PKG_BUILD)
endef
