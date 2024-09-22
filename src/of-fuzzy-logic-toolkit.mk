# This file is part of MXE.
# See index.html for further information.

PKG             := of-fuzzy-logic-toolkit
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.6.1
$(PKG)_CHECKSUM := f07eefdf15b64ac9c0cf28e54e5b4502c878fc34
$(PKG)_REMOTE_SUBDIR := 
$(PKG)_SUBDIR   := fuzzy-logic-toolkit-$($(PKG)_VERSION)
$(PKG)_FILE     := fuzzy-logic-toolkit-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/lmarkowsky/fuzzy-logic-toolkit/archive/refs/tags/$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     := 

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
    $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,lmarkowsky,fuzzy-logic-toolkit,)
endef

define $(PKG)_BUILD
    $(OCTAVE_FORGE_PKG_BUILD)
endef
