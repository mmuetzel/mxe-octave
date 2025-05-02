# This file is part of MXE.
# See index.html for further information.

PKG             := of-image
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.16.1
$(PKG)_CHECKSUM := 2e3c5331c6dd8498a30bbcae8f524c5ec49c8288
$(PKG)_REMOTE_SUBDIR :=
$(PKG)_SUBDIR   := image-$($(PKG)_VERSION)
$(PKG)_FILE     := image-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := '$(OCTAVE_FORGE_BASE_URL)/$($(PKG)_FILE)/download'
$(PKG)_DEPS     :=

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
    $(PKG)_DEPS += $(OCTAVE_TARGET)
    ifeq ($(MXE_NATIVE_BUILD),no)
        ifeq ($(USE_SYSTEM_OCTAVE),no)
            # Remove this when package builds without calling Octave
            $(PKG)_DEPS += build-octave
        endif
    endif
endif

define $(PKG)_UPDATE
    $(OCTAVE_FORGE_PKG_UPDATE)
endef

define $(PKG)_BUILD
    $(OCTAVE_FORGE_PKG_BUILD)
endef
