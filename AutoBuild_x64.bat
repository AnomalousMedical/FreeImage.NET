::Configuration Settings
set GeneratorName=Visual Studio 12 Win64
set Platform=x64
set SrcFolder=..\Ogre\depsrc
set BuildFolder=Win64Build
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
set BuildCommand="C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" /m
set CurrentDirectory=%CD%

set BuildPath="%~dp0%BuildFolder%"
set SrcPath="%~dp0%SrcFolder%"

::Actual build process
rmdir /s /q %BuildPath%
mkdir %BuildPath%
cd %BuildPath%

cmake -G "%GeneratorName%" %Variables% %SrcPath%

%BuildCommand% "%SolutionName%" /property:Configuration=Debug;Platform=%Platform%
%BuildCommand% "%SolutionName%" /property:Configuration=Release;Platform=%Platform%

cd %CurrentDirectory%