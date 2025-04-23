# This file is part of MXE.
# See index.html for further information.

PKG             := opkg-image-acquisition
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.3.3
$(PKG)_CHECKSUM := 1ea02bdfd8428f9d09855538bc807d538e8c645b
$(PKG)_SUBDIR   := image-acquisition-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_SUBDIR).tar.gz
$(PKG)_URL      := https://github.com/Andy1978/octave-image-acquisition/releases/download/$($(PKG)_SUBDIR)/$($(PKG)_FILE)
$(PKG)_DEPS     := 

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
  $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

ifeq ($(MXE_SYSTEM),mingw)
  $(PKG)_OPTIONS := \
    FLTK_CONFIG='$(BUILD_TOOLS_PREFIX)/bin/$(MXE_TOOL_PREFIX)fltk-config'
else
  $(PKG)_OPTIONS := 
endif

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,Andy1978,octave-image-acquisition,v)
endef

define $(PKG)_BUILD
  $(call OCTAVE_FORGE_PKG_BUILD,$(1),$(2),$(3),$($(PKG)_OPTIONS))
endef
