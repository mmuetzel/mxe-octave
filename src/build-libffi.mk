# This file is part of MXE.
# See index.html for further information.

_PKG            := libffi
PKG             := build-$(_PKG)
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.4.3
$(PKG)_CHECKSUM := 9b0629c8efc70f608afb426c09cafabd2b717f50
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
