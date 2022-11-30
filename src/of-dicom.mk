# This file is part of MXE.
# See index.html for further information.

PKG             := of-dicom
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.5.1
$(PKG)_CHECKSUM := 9b0286d3d0ec45e389c214f02f11153d4404d298
$(PKG)_REMOTE_SUBDIR :=
$(PKG)_SUBDIR   := dicom-$($(PKG)_VERSION)
$(PKG)_FILE     := dicom-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := http://$(SOURCEFORGE_MIRROR)/octave/$($(PKG)_FILE)?download
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
    $(OCTAVE_FORGE_PKG_UPDATE)
endef

define $(PKG)_BUILD
    $(call OCTAVE_FORGE_PKG_BUILD,$(1),$(2),$(3),$($(PKG)_OPTIONS))
endef
