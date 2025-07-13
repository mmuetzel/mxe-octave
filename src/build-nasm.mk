# This file is part of MXE.
# See index.html for further information.

PKG             := build-nasm
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.16.03
$(PKG)_CHECKSUM := d3ceab29f8c62bdf9240032349deb594cb642863
$(PKG)_SUBDIR   := nasm-$($(PKG)_VERSION)
$(PKG)_FILE     := nasm-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := https://www.nasm.us/pub/nasm/releasebuilds/$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_DEPS     := 

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://www.nasm.us/pub/nasm/releasebuilds/?C=M;O=D' | \
    $(SED) -n 's,.*href="\([0-9\.]*[^a-z]\)/".*,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
    mkdir '$(1).build'
    cd '$(1).build' && '$(1)/configure' \
        --prefix='$(BUILD_TOOLS_PREFIX)' 
    $(MAKE) -C '$(1).build' -j '$(JOBS)' 
    $(MAKE) -C '$(1).build' -j 1 install DESTDIR='$(3)'
endef
