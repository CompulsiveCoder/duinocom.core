mkdir -p pkg
mkdir -p pkg/archive

mv -f pkg/*.nupkg pkg/archive

mono lib/nuget.exe pack Package.nuspec -OutputDirectory pkg/
