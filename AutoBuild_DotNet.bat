::Configuration Settings
set SolutionName=FreeImage.NET.sln

::Less likely to need to change these.
set ThisFolder=%~dp0
set RootDependencyFolder=%ThisFolder%..\
set BuildCommand="C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe"

set SolutionPath=%ThisFolder%%SolutionName%

%BuildCommand% "%SolutionPath%" /property:Configuration=Release /target:Clean
%BuildCommand% "%SolutionPath%" /property:Configuration=Release