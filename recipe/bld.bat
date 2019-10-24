cmake -G Ninja ^
  -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
  -DCMAKE_BUILD_TYPE=Release ^
  -DCMAKE_DISABLE_FIND_PACKAGE_Git=TRUE ^
  -DBUILD_SHARED_LIBS=ON ^
  -DNNG_TESTS=OFF ^
  -DNNG_ENABLE_NNGCAT=ON ^
  -DNNG_ENABLE_TLS=OFF ^
  %SRC_DIR%
if errorlevel 1 exit 1

ninja install
if errorlevel 1 exit 1
