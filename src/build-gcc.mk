# This file is part of MXE.
# See index.html for further information.

PKG             := build-gcc
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 15.2.0
$(PKG)_CHECKSUM := e9265c98ae18a6d952a636749d98c475ba2ca006
$(PKG)_SUBDIR   := gcc-$($(PKG)_VERSION)
$(PKG)_FILE     := gcc-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := https://ftp.gnu.org/gnu/gcc/gcc-$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_URL_2    := https://ftpmirror.gnu.org/gcc/gcc-$($(PKG)_VERSION)/$($(PKG)_FILE)

$(PKG)_DEPS := gcc-gmp gcc-isl gcc-mpc gcc-mpfr
ifneq ($(MXE_NATIVE_BUILD),yes)
  $(PKG)_DEPS += build-binutils
endif
ifeq ($(MXE_SYSTEM),mingw)
  $(PKG)_DEPS += mingw-w64
  ifeq ($(HOST_THREADS),mcf)
    $(PKG)_DEPS += mcfgthread build-meson build-ninja
  endif
endif

ifneq ($(BUILD_SHARED),yes)
  $(PKG)_STATIC_FLAG := --static
endif

ifeq ($(MXE_SYSTEM),mingw)
  $(PKG)_SYSDEP_CONFIGURE_OPTIONS := \
    --enable-version-specific-runtime-libs \
    --with-gcc \
    --with-gnu-ld \
    --with-gnu-as \
    --disable-nls \
    --without-x \
    --disable-win32-registry \
    --enable-threads=$(HOST_THREADS)

  ifneq ($(TARGET),x86_64-w64-mingw32)
    $(PKG)_SYSDEP_CONFIGURE_OPTIONS += \
    --libdir='$(BUILD_TOOLS_PREFIX)/lib' \
    --with-native-system-header-dir='/include' \
    --disable-sjlj-exceptions \
    --with-specs='%{!mfpmath:-mfpmath=sse} %{!msse:%{!mno-sse:-msse}} %{!msse2:%{!mno-sse2:-msse2}}'
  else
    define $(PKG)_PRE_BUILD
      echo "Shortcuts"
      # create shortcuts
      if ! [ -L $(BUILD_TOOLS_PREFIX)/mingw ]; then \
        ln -s $(HOST_PREFIX) $(BUILD_TOOLS_PREFIX)/mingw; \
      fi
    endef
  endif

  $(PKG)_WINAPI_VERSION_FLAGS := --with-default-win32-winnt=$(HOST_WIN32_WINNT)

  ifneq ($(HOST_MSVCRT),ucrt)
    $(PKG)_DEFAULT_MSVCRT := --with-default-msvcrt=msvcrt
  else
    $(PKG)_DEFAULT_MSVCRT := --with-default-msvcrt=ucrt
  endif

  define $(PKG)_INSTALL_SYSTEM_HEADERS
    $($(PKG)_PRE_BUILD)
    # install mingw-w64 headers
    $(call PREPARE_PKG_SOURCE,mingw-w64,$(1))
    mkdir '$(1).headers'
    cd '$(1).headers' && '$(1)/$(mingw-w64_SUBDIR)/mingw-w64-headers/configure' \
      --host='$(TARGET)' \
      --prefix='$(HOST_PREFIX)' \
      --enable-sdk=all \
      --enable-idl \
      --enable-secure-api \
      $($(PKG)_WINAPI_VERSION_FLAGS) \
      $($(PKG)_DEFAULT_MSVCRT) \
      $(mingw-w64-headers_CONFIGURE_OPTS) \
      --disable-dependency-tracking
    $(MAKE) -C '$(1).headers' install
  endef

  define $(PKG)_BUILD_SYSTEM_RUNTIME
    # build standalone gcc
    $(MAKE) -C '$(1).build' -j '$(JOBS)' all-gcc
    $(MAKE) -C '$(1).build' -j 1 install-gcc
    # build mingw-w64-crt
    mkdir '$(1).crt-build'
    cd '$(1).crt-build' && '$(1)/$(mingw-w64_SUBDIR)/mingw-w64-crt/configure' \
      --host='$(TARGET)' \
      --prefix='$(HOST_PREFIX)' \
      $(if $(filter $(TARGET), x86_64-w64-mingw32),--disable-lib32) \
      --with-sysroot='$(HOST_PREFIX)' \
      $($(PKG)_DEFAULT_MSVCRT) \
      --disable-dependency-tracking
    $(MAKE) -C '$(1).crt-build' -j '$(JOBS)' || $(MAKE) -C '$(1).crt-build' -j '$(JOBS)'
    $(MAKE) -C '$(1).crt-build' -j 1 install
  endef

  ifeq ($(HOST_THREADS),mcf)
    ifeq ($(MXE_NATIVE_BUILD),no)
      $(PKG)_MESON_TOOLCHAIN_FILE := --cross-file '$(HOST_PREFIX)/share/meson/cross/mxe-conf.ini'
    else
      $(PKG)_MESON_TOOLCHAIN_FILE := --native-file '$(HOST_PREFIX)/share/meson/native/mxe-conf.ini'
    endif

    ifeq ($(BUILD_SHARED),yes)
      $(PKG)_MESON_CONFIG_FLAGS += --default-library=shared
    else
      $(PKG)_MESON_CONFIG_FLAGS += --default-library=static
    endif

    define $(PKG)_BUILD_SYSTEM_THREADS
      # build MCF GThreads
      $(call PREPARE_PKG_SOURCE,mcfgthread,$(1))
      mkdir '$(1).mcfgthread'
      meson setup \
        $($(PKG)_MESON_TOOLCHAIN_FILE) \
        $($(PKG)_MESON_CONFIG_FLAGS) \
        --prefix='$(HOST_PREFIX)' \
        --buildtype=plain \
        '$(1).mcfgthread' \
        '$(1)/$(mcfgthread_SUBDIR)'
      meson compile -C '$(1).mcfgthread' -j $(JOBS)
      meson install -C '$(1).mcfgthread'
    endef
  else
    define $(PKG)_BUILD_SYSTEM_THREADS
      # build posix threads
      mkdir '$(1).pthreads'
      cd '$(1).pthreads' && '$(1)/$(mingw-w64_SUBDIR)/mingw-w64-libraries/winpthreads/configure' \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        --prefix='$(HOST_PREFIX)' \
        $(ENABLE_SHARED_OR_STATIC) \
        --disable-dependency-tracking
      $(MAKE) -C '$(1).pthreads' -j '$(JOBS)' || $(MAKE) -C '$(1).pthreads' -j '$(JOBS)'
      $(MAKE) -C '$(1).pthreads' -j 1 install
    endef
  endif

  define $(PKG)_POST_BUILD
    # overwrite default specs to mimic stack protector handling of glibc
    # ./configure above doesn't do this
    '$(TARGET)-gcc' -dumpspecs > '$(BUILD_TOOLS_PREFIX)/lib/gcc/$(TARGET)/$($(PKG)_VERSION)/specs'
    $(SED) -i 's,-lmingwex,-lmingwex -lssp_nonshared -lssp,' '$(BUILD_TOOLS_PREFIX)/lib/gcc/$(TARGET)/$($(PKG)_VERSION)/specs'
  endef
endif

ifneq ($(MXE_NATIVE_BUILD),yes)
  $(PKG)_SYSDEP_CONFIGURE_OPTIONS += \
    --target='$(TARGET)' \
    --build='$(BUILD_SYSTEM)' \
    --with-as='$(BUILD_TOOLS_PREFIX)/bin/$(TARGET)-as' \
    --with-ld='$(BUILD_TOOLS_PREFIX)/bin/$(TARGET)-ld' \
    --with-nm='$(BUILD_TOOLS_PREFIX)/bin/$(TARGET)-nm' \
    --disable-multilib  --with-host-libstdcxx="-lstdc++" --with-system-zlib

  ifeq ($(ENABLE_WINDOWS_64),yes)
    $(PKG)_SYSDEP_CONFIGURE_OPTIONS += \
      --enable-64bit --disable-32bit --enable-fully-dynamic-string
  endif
else
  $(PKG)_SYSDEP_CONFIGURE_OPTIONS += \
      --disable-multilib
endif

define $(PKG)_UPDATE
    $(WGET) -q -O- 'http://ftp.gnu.org/gnu/gcc/?C=M;O=D' | \
    $(SED) -n 's,.*<a href="gcc-\([0-9][^"]*\)/".*,\1,p' | \
    $(SORT) -V | \
    tail -1
endef

define $(PKG)_CONFIGURE
    # configure gcc
    mkdir '$(1).build'
    cd    '$(1).build' && '$(1)/configure' \
        --prefix='$(BUILD_TOOLS_PREFIX)' \
        --enable-languages='c,c++,fortran' \
        --disable-libsanitizer \
        $($(PKG)_SYSDEP_CONFIGURE_OPTIONS) \
        $(ENABLE_SHARED_OR_STATIC) \
        --disable-libgomp \
        --enable-default-ssp \
        --with-cloog='$(BUILD_TOOLS_PREFIX)' \
        --with-gmp='$(BUILD_TOOLS_PREFIX)' \
        --with-isl='$(BUILD_TOOLS_PREFIX)' \
        --with-mpc='$(BUILD_TOOLS_PREFIX)' \
        --with-mpfr='$(BUILD_TOOLS_PREFIX)' \
        $(shell [ `uname -s` == Darwin ] && echo "LDFLAGS='-Wl,-no_pie'")
endef

define $(PKG)_BUILD
  # Windows only.
  $($(PKG)_INSTALL_SYSTEM_HEADERS)

  # All systems.
  $($(PKG)_CONFIGURE)

  # Windows only.
  $($(PKG)_BUILD_SYSTEM_RUNTIME)
  $($(PKG)_BUILD_SYSTEM_THREADS)

  # Build rest of gcc.
  $(MAKE) -C '$(1).build' -j '$(JOBS)'
  $(MAKE) -C '$(1).build' -j 1 install

  if [ -f $(BUILD_TOOLS_PREFIX)/lib/gcc/$(TARGET)/lib/libgcc_s.a ]; then \
    mv $(BUILD_TOOLS_PREFIX)/lib/gcc/$(TARGET)/lib/libgcc_s.a $(BUILD_TOOLS_PREFIX)/lib/gcc/$(TARGET)/$($(PKG)_VERSION)/libgcc_s.a; \
  fi

  if [ -f $(BUILD_TOOLS_PREFIX)/lib/gcc/$(TARGET)/lib32/libgcc_s.a ]; then \
    mv $(BUILD_TOOLS_PREFIX)/lib/gcc/$(TARGET)/lib32/libgcc_s.a $(BUILD_TOOLS_PREFIX)/lib/gcc/$(TARGET)/$($(PKG)_VERSION)/32/libgcc_s.a; \
  fi

  # create pkg-config script
  if [ '$(MXE_NATIVE_BUILD)' = 'no' ]; then \
    (echo '#!/bin/sh'; \
     echo 'PKG_CONFIG_PATH="$$PKG_CONFIG_PATH_$(subst -,_,$(TARGET))" PKG_CONFIG_LIBDIR='\''$(HOST_LIBDIR)/pkgconfig'\'' exec pkg-config $($(PKG)_STATIC_FLAG) "$$@"') \
             > '$(BUILD_TOOLS_PREFIX)/bin/$(MXE_TOOL_PREFIX)pkg-config'; \
    chmod 0755 '$(BUILD_TOOLS_PREFIX)/bin/$(MXE_TOOL_PREFIX)pkg-config'; \
  fi

  $($(PKG)_POST_BUILD)
endef
