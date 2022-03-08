# This file is part of MXE.
# See index.html for further information.

PKG             := of-windows
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.6.2
$(PKG)_CHECKSUM := 63efb63ebd7839213ac29960416c4da8a35dcf17
$(PKG)_REMOTE_SUBDIR :=
$(PKG)_SUBDIR   := windows-$($(PKG)_VERSION)
$(PKG)_FILE     := windows-$($(PKG)_VERSION).tar.gz
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
