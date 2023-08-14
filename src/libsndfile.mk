# This file is part of MXE.
# See index.html for further information.

PKG             := libsndfile
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.2.2
$(PKG)_CHECKSUM := 28acc1c19b06c18f38f906d7efef404b2078a19a
$(PKG)_SUBDIR   := libsndfile-$($(PKG)_VERSION)
$(PKG)_FILE     := libsndfile-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/$(PKG)/$(PKG)/archive/$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     := sqlite flac lame mpg123 ogg opus vorbis

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,libsndfile,libsndfile,[v]*)
endef

define $(PKG)_BUILD
    cd '$(1)' && cmake \
        $($(PKG)_CMAKE_FLAGS) \
        -DBUILD_TESTING=no \
        -DBUILD_PROGRAMS=no \
        -DBUILD_EXAMPLES=no \
        -DINSTALL_MANPAGES=no \
        -DENABLE_EXTERNAL_LIBS=yes \
        $(CMAKE_CCACHE_FLAGS) \
        $(CMAKE_BUILD_SHARED_OR_STATIC) \
        -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)' \
        .

    $(MAKE) -C '$(1)' -j '$(JOBS)' VERBOSE=1
    $(MAKE) -C '$(1)' -j '1' VERBOSE=1 DESTDIR='$(3)' install

    if [ "$(ENABLE_DEP_DOCS)" == "no" ]; then \
        rm -rf '$(3)$(HOST_PREFIX)/share/doc/$(PKG)'; \
    fi
endef
