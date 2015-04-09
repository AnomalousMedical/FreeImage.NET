::Configuration Settings
set GeneratorName=NMake Makefiles
set SrcFolder=..\OgreDeps\src
set BuildFolder=AndroidBuild

::Less likely to need to change these.
set ThisFolder=%~dp0
set RootDependencyFolder=%ThisFolder%..\
set CurrentDirectory=%CD%

set BuildPath="%~dp0%BuildFolder%"
set SrcPath="%~dp0%SrcFolder%"

::Variables
set Variables=-D OGREDEPS_BUILD_AMD_QBS=0 ^
-D OGREDEPS_BUILD_CG=0 ^
-D OGREDEPS_BUILD_FREETYPE=0 ^
-D OGREDEPS_BUILD_NVIDIA_NVAPI=0 ^
-D OGREDEPS_BUILD_OIS=0 ^
-D OGREDEPS_BUILD_ZLIB=0 ^
-D OGREDEPS_BUILD_ZZIPLIB=0 ^
-D OGREDEPS_INSTALL_DEV=0 ^
-D OGREDEPS_BUILD_FREEIMAGE_DYNAMIC=1 ^
-D CMAKE_INSTALL_PREFIX=%InstallPath% ^
-DCMAKE_TOOLCHAIN_FILE=%SrcPath%\cmake\android.toolchain.cmake ^
-DLIBRARY_OUTPUT_PATH_ROOT=%BuildPath% ^
-DCMAKE_BUILD_TYPE=Release ^
-DANDROID_NATIVE_API_LEVEL=9 ^
-DANDROID_ABI=armeabi-v7a

::Acutal build process
rmdir /s /q %BuildPath%
mkdir %BuildPath%
cd %BuildPath%

cmake -G "%GeneratorName%" %Variables% %SrcPath%
nmake

cd %CurrentDirectory%