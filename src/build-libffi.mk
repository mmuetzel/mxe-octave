# This file is part of MXE.
# See index.html for further information.

_PKG            := libffi
PKG             := build-$(_PKG)
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.4.2
$(PKG)_CHECKSUM := f5fbf0e8b643c4029a069faca32dd0df2c7dd0a2
$(PKG)_SUBDIR   := $(_PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $(_PKG)-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/$(_PKG)/$(_PKG)/archive/refs/tags/v$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     := build-libtool

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://github.com/libffi/libffi/tags' | \
    $(SED) -n 's,.*releases/tag/v\([0-9][^"]*\).*,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
  cd '$(1)' && \
    ./autogen.sh && \
    ./configure \
      --prefix='$(BUILD_TOOLS_PREFIX)' \
      $(ENABLE_SHARED_OR_STATIC)

  $(MAKE) -C '$(1)' -j '$(JOBS)'
  $(MAKE) -C '$(1)' -j 1 install DESTDIR='$(3)' 

  if [ "$(ENABLE_DEP_DOCS)" == "no" ]; then \
    rm -rf "$(3)$(BUILD_TOOLS_PREFIX)/share"; \
  fi

endef
