# This file is part of MXE.
# See index.html for further information.

PKG             := texinfo
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 7.2
$(PKG)_CHECKSUM := 4dcf2858735275098bf07591f232984e8b6ba4fb
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://ftp.gnu.org/gnu/texinfo/$($(PKG)_FILE)
$(PKG)_DEPS     := gettext libiconv # libgnurx

ifeq ($(MXE_NATIVE_BUILD),yes)
  ifeq ($(USE_MSYS2),no)
    $(PKG)_DEPS += pcre2
    $(PKG)_LIBS += LDFLAGS="`PKG_CONFIG_PATH="$(HOST_LIBDIR)/pkgconfig" $(MXE_PKG_CONFIG) --libs libpcre2-8`"
  endif
else
  $(PKG)_CONFIGURE_OPTIONS := texinfo_cv_sys_iconv_converts_euc_cn=no
endif

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://ftp.gnu.org/gnu/$(PKG)/?C=M;O=D' | \
    $(SED) -n 's,.*<a href="$(PKG)-\([0-9][^"]*\)\.tar.*,\1,p' | \
    $(SORT) -V | \
    tail -1
endef

ifeq ($(MXE_NATIVE_BUILD),yes)
  ## We already have texinfo from the build-texinfo package.
  define $(PKG)_BUILD
  endef
else
  define $(PKG)_BUILD
    cd '$(1)' && autoreconf -fi
    mkdir '$(1).build'
    cd '$(1).build' && '$(1)/configure' \
      $($(PKG)_CONFIGURE_OPTIONS) \
      $(CONFIGURE_CPPFLAGS) $(CONFIGURE_LDFLAGS) \
      $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
      --prefix='$(HOST_PREFIX)' $($(PKG)_LIBS) \
      CC='$(MXE_CC) -std=gnu17'

    $(MAKE) -C '$(1).build' -j '$(JOBS)'

    $(MAKE) -C '$(1).build' -j 1 install DESTDIR='$(3)'
  endef
endif
