# This file is part of MXE.
# See index.html for further information.

PKG             := opkg-datatypes
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.1.8
$(PKG)_CHECKSUM := b67733784899071245bb4b9a45ec4a8cb3e3d04a
$(PKG)_REMOTE_SUBDIR := 
$(PKG)_SUBDIR   := datatypes-release-$($(PKG)_VERSION)
$(PKG)_FILE     := datatypes-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/pr0m1th3as/datatypes/releases/download/release-$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_DEPS     := 

ifeq ($(MXE_SYSTEM),mingw)
$(PKG)_OPTIONS := TARGET_OS=Windows_NT
else
$(PKG)_OPTIONS := 
endif

ifeq ($(ENABLE_BINARY_PACKAGES),yes)
    $(PKG)_DEPS += $(OCTAVE_TARGET)
endif

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,pr0m1th3as,datatypes,release-)
endef

define $(PKG)_BUILD
    $(call OCTAVE_FORGE_PKG_BUILD,$(1),$(2),$(3),$($(PKG)_OPTIONS))
endef
