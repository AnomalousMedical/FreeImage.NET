::Configuration Settings
set GeneratorName=Visual Studio 14
set Platform=Win32
set SrcFolder=..\OgreDeps\src
set BuildFolder=WindowsBuild
set SolutionName=OGREDEPS.sln
set Variables=-D OGREDEPS_BUILD_AMD_QBS=0 ^
-D OGREDEPS_BUILD_CG=0 ^
-D OGREDEPS_BUILD_FREETYPE=0 ^
-D OGREDEPS_BUILD_NVIDIA_NVAPI=0 ^
-D OGREDEPS_BUILD_OIS=0 ^
-D OGREDEPS_BUILD_ZLIB=0 ^
-D OGREDEPS_BUILD_ZZIPLIB=0 ^
-D OGREDEPS_INSTALL_DEV=0 ^
-D OGREDEPS_BUILD_FREEIMAGE_DYNAMIC=1

::Less likely to need to change these.
set ThisFolder=%~dp0
set RootDependencyFolder=%ThisFolder%..\
set CurrentDirectory=%CD%

set BuildPath="%~dp0%BuildFolder%"
set SrcPath="%~dp0%SrcFolder%"

::Actual build process
rmdir /s /q %BuildPath%
mkdir %BuildPath%
cd %BuildPath%

cmake -G "%GeneratorName%" %Variables% %SrcPath%

msbuild.exe "%SolutionName%" /property:Configuration=Debug;Platform=%Platform%
msbuild.exe "%SolutionName%" /property:Configuration=Release;Platform=%Platform%

cd %CurrentDirectory%