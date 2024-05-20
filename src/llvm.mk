# This file is part of MXE.
# See index.html for further information.

PKG             := llvm
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 18.1.6
$(PKG)_CHECKSUM := eb5c08768e9445d3a9b9ac3b9ad17f1378e3805f
$(PKG)_SUBDIR   := llvm-$($(PKG)_VERSION).src
$(PKG)_FILE     := llvm-$($(PKG)_VERSION).src.tar.xz
$(PKG)_URL      := https://github.com/llvm/llvm-project/releases/download/llvmorg-$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_DEPS     := build-cmake build-ninja build-python

define $(PKG)_UPDATE
    $(call GITHUB_PKG_UPDATE,llvm,llvm-project,llvmorg-)
endef

ifeq ($(MXE_NATIVE_BUILD),yes)
  ifeq ($(MXE_SYSTEM),gnu-linux)
    define $(PKG)_BUILD
      # download archive with cmake files
      if [ ! -f $(PKG_DIR)/cmake-$($(PKG)_VERSION).src.tar.xz ]; then \
        $(WGET) -N https://github.com/llvm/llvm-project/releases/download/llvmorg-$($(PKG)_VERSION)/cmake-$($(PKG)_VERSION).src.tar.xz \
          -O $(PKG_DIR)/cmake-$($(PKG)_VERSION).src.tar.xz; \
      fi
      # extract archive with cmake files
      cd '$(1)/..' && \
        xz -dc $(PKG_DIR)/cmake-$($(PKG)_VERSION).src.tar.xz | $(TAR) xf - && \
        mv cmake-$($(PKG)_VERSION).src cmake

      mkdir '$(1)/.build' && cd '$(1)/.build' && cmake .. \
        -GNinja \
        $($(PKG)_CMAKE_FLAGS) \
        $(CMAKE_CCACHE_FLAGS) \
        -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)' \
        -DLLVM_BUILD_LLVM_DYLIB=ON \
        -DLLVM_LINK_LLVM_DYLIB=ON \
        -DLLVM_VERSION_SUFFIX= \
        -DLLVM_TARGETS_TO_BUILD='X86' \
        -DLLVM_ENABLE_EH=ON \
        -DLLVM_ENABLE_RTTI=ON \
        -DLLVM_INCLUDE_BENCHMARKS=OFF \
        -DLLVM_BUILD_EXAMPLES=OFF \
        -DLLVM_INCLUDE_EXAMPLES=OFF \
        -DLLVM_BUILD_TESTS=OFF \
        -DLLVM_INCLUDE_TESTS=OFF \
        -DLLVM_INCLUDE_GO_TESTS=OFF \
        -DLLVM_INCLUDE_DOCS=OFF \
        -DLLVM_BUILD_DOCS=OFF \
        -DLLVM_ENABLE_DOXYGEN=OFF \
        -DLLVM_ENABLE_BACKTRACES=OFF

      cd '$(1)/.build' && DESTDIR=$(3) ninja -j $(JOBS) install
    endef
  else
    define $(PKG)_BUILD
      echo "unsupported LLVM configuration" 1>&2
      exit 1
    endef
  endif
else
  ifeq ($(ENABLE_WINDOWS_64),yes)
    $(PKG)_SYSDEP_CMAKE_OPTIONS += \
      -DLLVM_DEFAULT_TARGET_TRIPLE='x86_64-w64-windows-gnu' \
      -DLLVM_HOST_TRIPLE='x86_64-w64-windows-gnu'
  else
    $(PKG)_SYSDEP_CMAKE_OPTIONS += \
      -DLLVM_DEFAULT_TARGET_TRIPLE='i686-w64-windows-gnu' \
      -DLLVM_HOST_TRIPLE='i686-w64-windows-gnu'
  endif
  ifeq ($(USE_CCACHE),yes)
    $(PKG)_CCACHE_OPTIONS += \
      -DLLVM_CCACHE_BUILD=ON
  endif

  define $(PKG)_BUILD
    # download archive with cmake files
    if [ ! -f $(PKG_DIR)/cmake-$($(PKG)_VERSION).src.tar.xz ]; then \
      $(WGET) -N https://github.com/llvm/llvm-project/releases/download/llvmorg-$($(PKG)_VERSION)/cmake-$($(PKG)_VERSION).src.tar.xz \
        -O $(PKG_DIR)/cmake-$($(PKG)_VERSION).src.tar.xz; \
    fi
    # extract archive with cmake files
    cd '$(1)/..' && \
      xz -dc $(PKG_DIR)/cmake-$($(PKG)_VERSION).src.tar.xz | $(TAR) xf - && \
      mv cmake-$($(PKG)_VERSION).src cmake

    # No way to pass this for native llvm-config when cross-compiling. Modify cmake file instead.
    $(SED) -i 's/\(option(LLVM_INCLUDE_BENCHMARKS.*\)ON/\1OFF/' '$(1)/CMakeLists.txt'

    mkdir '$(1)/.build'
    cd '$(1)/.build' && 'cmake' .. \
      -GNinja \
      $($(PKG)_CMAKE_FLAGS) \
      $(CMAKE_CCACHE_FLAGS) \
      -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)' \
      -DLLVM_BUILD_TOOLS=OFF \
      -DLLVM_BUILD_LLVM_DYLIB=OFF \
      -DLLVM_LINK_LLVM_DYLIB=OFF \
      -DLLVM_VERSION_SUFFIX= \
      -DLLVM_TARGETS_TO_BUILD='X86' \
      $($(PKG)_SYSDEP_CMAKE_OPTIONS) \
      -DCROSS_TOOLCHAIN_FLAGS_NATIVE='-DCMAKE_TOOLCHAIN_FILE="$(CMAKE_NATIVE_TOOLCHAIN_FILE)"' \
      -DLLVM_ENABLE_EH=ON \
      -DLLVM_ENABLE_RTTI=ON \
      -DLLVM_BUILD_EXAMPLES=OFF \
      -DLLVM_INCLUDE_EXAMPLES=OFF \
      -DLLVM_BUILD_TESTS=OFF \
      -DLLVM_INCLUDE_TESTS=OFF \
      -DLLVM_INCLUDE_GO_TESTS=OFF \
      -DLLVM_ENABLE_BACKTRACES=OFF \
      -DLLVM_INCLUDE_DOCS=OFF \
      -DLLVM_BUILD_DOCS=OFF \
      -DLLVM_ENABLE_DOXYGEN=OFF \
      -DLLVM_ENABLE_OCAMLDOC=OFF \
      -DLLVM_ENABLE_BINDINGS=OFF \
      -DLLVM_ENABLE_SPHINX=OFF \
      -DLLVM_BUILD_RUNTIME=OFF \
      -DLLVM_BUILD_RUNTIMES=OFF \
      -DLLVM_INCLUDE_RUNTIMES=OFF \
      $($(PKG)_CCACHE_OPTIONS)

    cd '$(1)/.build' && DESTDIR=$(3) ninja -j $(JOBS) llvm-config
    cd '$(1)/.build' && DESTDIR=$(3) ninja -j $(JOBS) install

    # install native llvm-config in HOST_BINDIR because it won't find the libs otherwise
    $(INSTALL) -d '$(HOST_BINDIR)'
    $(INSTALL) -m755 '$(1)/.build/NATIVE/bin/llvm-config' '$(HOST_BINDIR)/$(MXE_TOOL_PREFIX)llvm-config'
  endef
endif
