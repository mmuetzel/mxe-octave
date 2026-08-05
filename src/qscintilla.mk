# This file is part of MXE.
# See index.html for further information.

PKG             := qscintilla
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.14.1
$(PKG)_CHECKSUM := 433cc4cb7da65c25a11ea3efbc5a7db31c6d7e3c
$(PKG)_SUBDIR   := QScintilla_src-$($(PKG)_VERSION)
$(PKG)_FILE     := QScintilla_src-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://www.riverbankcomputing.com/static/Downloads/QScintilla/$($(PKG)_VERSION)/$($(PKG)_FILE)


ifeq ($(ENABLE_QT),5)
      $(PKG)_DEPS     := qt5
endif
ifeq ($(ENABLE_QT),6)
      $(PKG)_DEPS     := qt6
endif

define $(PKG)_UPDATE
    $(WGET) -q -O- 'http://www.riverbankcomputing.com/software/qscintilla/download' | \
        $(SED) -n 's,.*QScintilla_src-\([0-9][^>]*\)\.zip.*,\1,p' | \
        head -n 1 
endef

ifneq ($(MXE_NATIVE_BUILD),yes)
  ifeq ($(MXE_SYSTEM),mingw)
    ifeq ($(ENABLE_QT),5)
       $(PKG)_QMAKE_SPEC_OPTION := -spec '$(BUILD_TOOLS_PREFIX)/mkspecs/win32-g++'
    endif
    ifeq ($(ENABLE_QT),6)
       $(PKG)_QMAKE_SPEC_OPTION := -spec '$(HOST_PREFIX)/qt6/mkspecs/win32-g++'
    endif
  endif
  ifeq ($(MXE_SYSTEM),msvc)
    # FIXME: compute "2010" suffix dynamically
    $(PKG)_QMAKE_SPEC_OPTION := -spec '$(HOST_LIBDIR)/qt4/mkspecs/win32-msvc2010'
  endif
endif

define $(PKG)_BUILD
    if [ "$(MXE_NATIVE_BUILD)" = "no" ]; then \
      '$(MXE_QMAKE)' -set CROSS_COMPILE $(MXE_TOOL_PREFIX); \
    fi
    cd '$(1)/src' && \
      '$(MXE_QMAKE)' -makefile  \
        $($(PKG)_QMAKE_SPEC_OPTION) \
        QMAKE_UIC='$(MXE_UIC)' \
        QMAKE_MOC='$(MXE_MOC)' \
        QMAKE_LFLAGS=$(MXE_LDFLAGS) \
        QT_MAJOR_VERSION=$(ENABLE_QT)

    if [ $(MXE_SYSTEM) = msvc ]; then \
        mkdir -p '$(3)' && \
        cd '$(1)/src' && \
        env -u MAKE -u MAKEFLAGS nmake && \
        env -u MAKE -u MAKEFLAGS nmake \
            INSTALL_ROOT=`cd $(3) && pwd -W | sed -e 's,^[a-zA-Z]:,,' -e 's,/,\\\\,g'` install; \
    else \
        $(MAKE) -C '$(1)/src' -j '$(JOBS)' && \
        $(MAKE) -C '$(1)/src' -j 1 install INSTALL_ROOT='$(3)'; \
    fi

    if [ $(MXE_SYSTEM) = mingw ]; then \
      $(INSTALL) -d '$(3)$(HOST_BINDIR)'; \
      if [ "$(ENABLE_QT)" = "5" ]; then \
        mv '$(3)$(HOST_PREFIX)/qt5/lib/qscintilla2_qt5.dll' '$(3)$(HOST_BINDIR)'; \
      elif [ "$(ENABLE_QT)" = "6" ]; then \
        mv '$(3)$(HOST_PREFIX)/qt6/lib/qscintilla2_qt6.dll' '$(3)$(HOST_BINDIR)'; \
      else \
        mv '$(3)$(HOST_LIBDIR)/qscintilla2_qt4.dll' '$(3)$(HOST_BINDIR)/'; \
      fi; \
    fi

    # Qmake under MSVC uses Win32 paths. When combining this with
    # DESTDIR usage (or equivalent), the real Win32 directory hierarchy
    # is recreated under DESTDIR, not the MSYS hierarchy.
    if [ $(MXE_SYSTEM) = msvc ]; then \
        $(INSTALL) -d '$(3)$(CMAKE_HOST_PREFIX)/bin'; \
        $(INSTALL) -m755 '$(3)$(CMAKE_HOST_PREFIX)/lib/$(LIBRARY_PREFIX)qscintilla2$(LIBRARY_SUFFIX).dll' '$(3)$(CMAKE_HOST_PREFIX)/bin/'; \
        rm -f '$(3)$(CMAKE_HOST_PREFIX)/lib/$(LIBRARY_PREFIX)qscintilla2$(LIBRARY_SUFFIX).dll'; \
    fi
endef

