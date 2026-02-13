# This file is part of MXE.
# See index.html for further information.

PKG             := libproxy
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.4.18
$(PKG)_CHECKSUM := bbd709a204b943df0e317e37efa7c3365880ca7b
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_SUBDIR).tar.gz
$(PKG)_URL      := https://github.com/libproxy/libproxy/archive/$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     :=

$(PKG)_CMAKE_FLAGS :=

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,libproxy,libproxy,)
endef

define $(PKG)_BUILD
    cd '$(1)' && cmake \
        $($(PKG)_CMAKE_FLAGS) \
        -DWITH_KDE=no \
        -DBUILD_TESTING=no \
        $(CMAKE_CCACHE_FLAGS) \
        $(CMAKE_BUILD_SHARED_OR_STATIC) \
        -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)' \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        .

    $(MAKE) -C '$(1)' -j '$(JOBS)' VERBOSE=1
    $(MAKE) -C '$(1)' -j '1' VERBOSE=1 DESTDIR='$(3)' install

    ## Note error in installed .dll.a file name.
    if [ $(MXE_SYSTEM) = mingw ]; then \
        $(INSTALL) -d '$(3)$(HOST_BINDIR)'; \
        $(INSTALL) '$(3)$(HOST_LIBDIR)/libproxy.dll' '$(3)$(HOST_BINDIR)/'; \
        rm -f '$(3)$(HOST_LIBDIR)/libproxy.dll'; \
        mv '$(3)$(HOST_LIBDIR)/liblibproxy.dll.a' '$(3)$(HOST_LIBDIR)/libproxy.dll.a'; \
    fi
endef
