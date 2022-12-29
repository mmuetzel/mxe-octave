# This file is part of MXE.
# See index.html for further information.

PKG             := paho-mqtt-c
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.3.12
$(PKG)_CHECKSUM := 34dc18d5df21d816276875da2fde314569865e14
$(PKG)_SUBDIR   := paho.mqtt.c-$($(PKG)_VERSION)
$(PKG)_FILE     := $($(PKG)_SUBDIR).tar.gz
$(PKG)_URL      := https://github.com/eclipse/paho.mqtt.c/archive/refs/tags/v$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     :=

$(PKG)_CMAKE_FLAGS :=

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,eclipse,paho.mqtt.c,v)
endef

define $(PKG)_BUILD
    cd '$(1)' && cmake \
        $($(PKG)_CMAKE_FLAGS) \
        $(CMAKE_CCACHE_FLAGS) \
	$(if $(BUILD_SHARED),-DPAHO_BUILD_SHARED=ON -DPAHO_BUILD_STATIC=OFF,-DPAHO_BUILD_SHARED=OFF -DPAHO_BUILD_STATIC=ON) \
	-DPAHO_BUILD_DOCUMENTATION=OFF \
	-DPAHO_ENABLE_TESTING=OFF \
	-DPAHO_BUILD_SAMPLES=OFF \
        -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)' \
        .

    $(MAKE) -C '$(1)' -j '$(JOBS)' VERBOSE=1
    $(MAKE) -C '$(1)' -j '1' VERBOSE=1 DESTDIR='$(3)' install
    if [ "$(ENABLE_DEP_DOCS)" == "no" ]; then \
      rm -rf "$(3)$(HOST_PREFIX)/share/doc/Eclipse Paho C"; \
    fi
endef
