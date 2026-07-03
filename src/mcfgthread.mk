# This file is part of MXE.
# See index.html for further information.

PKG             := mcfgthread
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.4-ga.2
$(PKG)_CHECKSUM := 975f991c6ffbb485ce6cc89413aba8f080024ab3
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_SUBDIR).tar.gz
$(PKG)_URL      := https://github.com/lhmouse/$(PKG)/archive/v$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     :=
define $(PKG)_UPDATE
  $(call GITHUB_PKG_UPDATE,lhmouse,mcfgthread,v)
endef

define $(PKG)_BUILD
  # do nothing - only download tarball
  # The library is built as part of GCC.
endef

