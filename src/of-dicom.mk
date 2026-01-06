# This file is part of MXE.
# See index.html for further information.

PKG             := of-dicom
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.7.1
$(PKG)_CHECKSUM := 38160dbec176f1c925d41bde0ddf5a26a8567256
$(PKG)_REMOTE_SUBDIR :=
$(PKG)_SUBDIR   := dicom-$($(PKG)_VERSION)
$(PKG)_FILE     := dicom-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/gnu-octave/octave-dicom/releases/download/release-$($(PKG)_VERSION)/$($(PKG)_SUBDIR).tar.gz
$(PKG)_DEPS     := gdcm

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
    $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

ifeq ($(MXE_NATIVE_BUILD),no)
    $(PKG)_OPTIONS := CMAKE_BINARY="cmake $(CMAKE_CCACHE_FLAGS) $(CMAKE_BUILD_SHARED_OR_STATIC) -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)'"
else
    $(PKG)_OPTIONS := 
endif

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,gnu-octave,octave-dicom,release-)
endef

define $(PKG)_BUILD
    $(call OCTAVE_FORGE_PKG_BUILD,$(1),$(2),$(3),$($(PKG)_OPTIONS))
endef
