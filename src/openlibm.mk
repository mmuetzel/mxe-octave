# This file is part of MXE.
# See index.html for further information.

PKG             := openlibm
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.8.1
$(PKG)_CHECKSUM := 4b1dffada65215942a31f3266b65b27eadd363cc
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_SUBDIR).tar.gz
$(PKG)_URL      := https://github.com/JuliaMath/$(PKG)/archive/v$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     :=

$(PKG)_TARGET_OPTS := 

ifeq ($(MXE_NATIVE_BUILD),no)
  ifeq ($(ENABLE_WINDOWS_64),yes)
    $(PKG)_TARGET_OPTS := ARCH=x86_64
  else
    $(PKG)_TARGET_OPTS := ARCH=i686 
  endif
  $(PKG)_TARGET_OPTS += OS=WINNT TOOLPREFIX=$(MXE_TOOL_PREFIX)
  $(PKG)_TARGET_OPTS += CC=$(MXE_CC) AR=$(MXE_AR)
  $(PKG)_TARGET_OPTS += prefix=$(HOST_PREFIX)
endif

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,JuliaMath,openlibm,v)
endef

define $(PKG)_BUILD
    $(MAKE) -C '$(1)' -j '$(JOBS)' $($(PKG)_TARGET_OPTS)
    $(MAKE) -C '$(1)' -j '1' $($(PKG)_TARGET_OPTS) DESTDIR='$(3)' install
endef
