# This file is part of MXE.
# See index.html for further information.

PKG             := portaudio
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 19.7.0
$(PKG)_CHECKSUM := 90676f9b7856bf100b396d8f14cc95bbfb91fa40
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/PortAudio/$(PKG)/archive/v$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     := 

$(PKG)_SYSDEP_OPTIONS :=
ifeq ($(MXE_SYSTEM),mingw)
  $(PKG)_SYSDEP_OPTIONS += \
        --with-host_os=mingw \
        --with-winapi=wmme,directx \
        --with-dxdir=$(HOST_PREFIX)
endif

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,PortAudio,portaudio,v)
endef

define $(PKG)_BUILD
    cd '$(1)' && autoconf
    # libtool looks for a pei* format when linking shared libs
    # apparently there's no real difference b/w pei and pe
    # so we set the libtool cache variables
    # https://sourceware.org/cgi-bin/cvsweb.cgi/src/bfd/libpei.h?annotate=1.25&cvsroot=src
    cd '$(1)' && ./configure \
        $(HOST_AND_BUILD_CONFIGURE_OPTIONS) \
        --prefix='$(HOST_PREFIX)' \
        $(ENABLE_SHARED_OR_STATIC) \
        $($(PKG)_SYSDEP_OPTIONS) \
        ac_cv_path_AR=$(MXE_AR) \
        $(if $(filter $(BUILD_SHARED),yes),\
            lt_cv_deplibs_check_method='file_magic file format (pe-i386|pe-x86-64)' \
            lt_cv_file_magic_cmd='$$OBJDUMP -f')
    $(MAKE) -C '$(1)' -j '$(JOBS)' $(if $(filter $(BUILD_STATIC),yes),SHARED_FLAGS=) TESTS=
    $(MAKE) -C '$(1)' -j 1 install

endef

