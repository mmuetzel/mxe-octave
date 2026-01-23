# This file is part of MXE.
# See index.html for further information.

PKG             := build-gettext
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.26
$(PKG)_CHECKSUM := 303f56fa7f0acba9400b6e92afe2f9cdcf0ce8e7
$(PKG)_SUBDIR   := gettext-$($(PKG)_VERSION)
$(PKG)_FILE     := gettext-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://ftp.gnu.org/gnu/gettext/$($(PKG)_FILE)
$(PKG)_DEPS     := 

define $(PKG)_UPDATE
    $(WGET) -q -O- 'http://ftp.gnu.org/gnu/gettext/?C=M;O=D' | \
    $(SED) -n 's,.*<a href="gettext-\([0-9\.]*\)\.tar.*,\1,p' | \
    $(SORT) -V | \
    tail -1
endef

## See
##
## https://octave.discourse.group/t/octave-space-fails-to-build-gnutls/1573/19
##
## for a discussion about the CCACHE_NODIRECT setting below.

define $(PKG)_BUILD
  mkdir '$(1)/.build'
  cd '$(1)/.build' && \
    '$(1)/configure' \
      --prefix='$(BUILD_TOOLS_PREFIX)' \
      --without-libexpat-prefix \
      --without-libxml2-prefix \
      --without-emacs \
      $($(PKG)_CONFIGURE_OPTIONS)
  CCACHE_NODIRECT=1 $(MAKE) -C '$(1)/.build' -j '$(JOBS)'
  $(MAKE) -C '$(1)/.build' -j 1 $(MXE_DISABLE_DOCS) install DESTDIR='$(3)'
endef
