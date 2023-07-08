# This file is part of MXE.
# See index.html for further information.

PKG             := of-video
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.1.1
$(PKG)_CHECKSUM := cb4ee20924c4d442e082ced84b15f70ff38c977d
$(PKG)_REMOTE_SUBDIR := 
$(PKG)_SUBDIR   := video-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_SUBDIR).tar.gz
$(PKG)_URL      := https://github.com/Andy1978/octave-video/releases/download/$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_DEPS     := ffmpeg

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
    $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

ifeq ($(MXE_SYSTEM),mingw)
$(PKG)_OPTIONS := ac_cv_func_realloc_0_nonnull=yes ac_cv_func_malloc_0_nonnull=yes
else
$(PKG)_OPTIONS := 
endif

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,Andy1978,octave-video,)
endef

define $(PKG)_BUILD
    $(call OCTAVE_FORGE_PKG_BUILD,$(1),$(2),$(3),$($(PKG)_OPTIONS))
endef
