# This file is part of MXE.
# See index.html for further information.

PKG             := libffi
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 3.4.8
$(PKG)_CHECKSUM := 5aaeb77d856a2178b1b6d453f5389da67ab77e93
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/$(PKG)/$(PKG)/archive/refs/tags/v$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     :=

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,libffi,libffi,v)
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
