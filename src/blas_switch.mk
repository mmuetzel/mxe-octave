# This file is part of MXE.
# See index.html for further information.

PKG             := blas_switch
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.0.7
$(PKG)_CHECKSUM := b34a8b5aaf3a962cbdd6a16638aaf5f4c0fe66e1
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_SUBDIR).tar.gz
$(PKG)_URL      := https://github.com/lostbard/$(PKG)/archive/v$($(PKG)_VERSION).tar.gz

ifeq ($(ENABLE_QT),4)
      $(PKG)_DEPS     := qt
endif
ifeq ($(ENABLE_QT),5)
      $(PKG)_DEPS     := qt5
endif
ifeq ($(ENABLE_QT),6)
      $(PKG)_DEPS     := qt6
endif

ifeq ($(MXE_NATIVE_MINGW_BUILD),yes)
      $(PKG)_INSTALL_ROOT :=
else
      $(PKG)_INSTALL_ROOT := $(3)
endif

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,lostbard,blas_switch,v)
endef

$(PKG)_QMAKE_FLAGS := 
ifneq ($(MXE_NATIVE_BUILD),yes)
  ifeq ($(MXE_SYSTEM),mingw)
    ifeq ($(ENABLE_QT),4)
       $(PKG)_QMAKE_SPEC_OPTION := -spec '$(HOST_PREFIX)/mkspecs/win32-g++'
    endif
    ifeq ($(ENABLE_QT),5)
       $(PKG)_QMAKE_SPEC_OPTION := -spec '$(BUILD_TOOLS_PREFIX)/mkspecs/win32-g++'
       $(PKG)_QMAKE_FLAGS += QMAKE_CXXFLAGS='-std=c++11'
    endif
    ifeq ($(ENABLE_QT),6)
       $(PKG)_QMAKE_SPEC_OPTION := -spec '$(HOST_PREFIX)/qt6/mkspecs/win32-g++'
       $(PKG)_QMAKE_FLAGS += QMAKE_CXXFLAGS='-std=c++17'
    endif
  endif
  ifeq ($(MXE_SYSTEM),msvc)
    # FIXME: compute "2010" suffix dynamically
    $(PKG)_QMAKE_SPEC_OPTION := -spec '$(HOST_LIBDIR)/qt4/mkspecs/win32-msvc2010'
  endif
endif

define $(PKG)_BUILD
    cd '$(1)' && \
      '$(MXE_QMAKE)' -makefile \
        $($(PKG)_QMAKE_SPEC_OPTION) \
	$($(PKG)_QMAKE_FLAGS) \
        QMAKE_UIC='$(MXE_UIC)' \
        QMAKE_MOC='$(MXE_MOC)' \
        QMAKE_LFLAGS=$(MXE_LDFLAGS)

    $(MAKE) -C '$(1)' -j '$(JOBS)'
    $(MAKE) -C '$(1)' -j 1 install INSTALL_ROOT='$($(PKG)_INSTALL_ROOT)'

    if [ $(MXE_WINDOWS_BUILD) = yes ]; then \
      $(INSTALL) -d '$(HOST_BINDIR)'; \
      mv '$(HOST_PREFIX)/qt$(ENABLE_QT)/bin/blas_switch.exe' '$(HOST_BINDIR)/blas_switch.exe'; \
    fi
endef
