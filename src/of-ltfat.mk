# This file is part of MXE.
# See index.html for further information.

PKG             := of-ltfat
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.6.0
$(PKG)_CHECKSUM := 6e9a197c073a9aa72247d39aa207f2bdc6e82655
$(PKG)_REMOTE_SUBDIR :=
$(PKG)_SUBDIR   := ltfat
$(PKG)_FILE     := ltfat-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/ltfat/ltfat/releases/download/v$($(PKG)_VERSION)/ltfat-$($(PKG)_VERSION)-of.tar.gz
$(PKG)_DEPS     := portaudio

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
    $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

ifeq ($(MXE_SYSTEM),mingw)
$(PKG)_OPTIONS := OPTCXXFLAGS='-DLTFAT_BUILD_STATIC -DMINGW=1' MINGW=1
else
$(PKG)_OPTIONS := 
endif

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,ltfat,ltfat,v)
endef

define $(PKG)_BUILD
    $(call OCTAVE_FORGE_PKG_BUILD,$(1),$(2),$(3),$($(PKG)_OPTIONS))
endef
