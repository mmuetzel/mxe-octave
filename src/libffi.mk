# This file is part of MXE.
# See index.html for further information.

PKG             := libffi
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.4.4
$(PKG)_CHECKSUM := a41563cd30ddf8af81aa87f80e673602fc6fd602
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/$(PKG)/$(PKG)/archive/refs/tags/v$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     :=

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://github.com/libffi/libffi/tags' | \
    $(SED) -n 's,.*releases/tag/v\([0-9][^"]*\).*,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
  cd '$(1)' && \
    ./autogen.sh && \
    ./configure \
      $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
      --prefix='$(HOST_PREFIX)' \
      $(CONFIGURE_CPPFLAGS) $(CONFIGURE_LDFLAGS) \
      $(ENABLE_SHARED_OR_STATIC) && \
    $(CONFIGURE_POST_HOOK)

  $(MAKE) -C '$(1)/$(TARGET)' -j '$(JOBS)'
  $(MAKE) -C '$(1)/$(TARGET)' -j 1 install DESTDIR='$(3)' 

  if [ "$(ENABLE_DEP_DOCS)" == "no" ]; then \
    rm -rf "$(3)$(HOST_PREFIX)/share"; \
  fi

endef
