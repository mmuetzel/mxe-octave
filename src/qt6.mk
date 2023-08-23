PKG             := qt6
$(PKG)_VERSION   = $(qtbase_VERSION)
$(PKG)_DEPS     := $(patsubst $(TOP_DIR)/src/%.mk,%,\
                        $(shell grep -l 'qt6-qtbase_VERSION' \
                                $(TOP_DIR)/src/qt6-*.mk))
$(PKG)_FILE      =
$(PKG)_URL       =
$(PKG)_CHECKSUM := #No checksum

define $(PKG)_UPDATE
    echo 'Warning: Updates are temporarily disabled for package $(PKG).' >&2;
    echo $($(PKG)_VERSION)
endef

