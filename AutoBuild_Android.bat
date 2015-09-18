::Configuration Settings
set GeneratorName=Visual Studio 14 ARM
set SrcFolder=..\OgreDeps\src
set BuildFolder=AndroidBuild
set SolutionName=OGREDEPS.sln

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
-DANDROID_NATIVE_API_LEVEL=19 ^
-DCMAKE_GENERATOR_TOOLSET=Gcc_4_9 ^
-DANDROID_STL=gnustl_static ^
-DANDROID_ABI=armeabi-v7a with NEON

call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\Tools\VsDevCmd.bat"

::Acutal build process
rmdir /s /q %BuildPath%
mkdir %BuildPath%
cd %BuildPath%

cmake -G "%GeneratorName%" %Variables% %SrcPath%

:: Small hack to fix the output file names since cmake cannot do this on its own for now
%RootDependencyFolder%CMakeHacks.exe replace %BuildPath% *.vcxproj "<ObjectFileName>$(IntDir)</ObjectFileName>" "<ObjectFileName>$(IntDir)%%(filename).o</ObjectFileName>"

msbuild.exe /m "%SolutionName%" /property:Configuration=Release

cd %CurrentDirectory%