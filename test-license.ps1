Set-PSDebug -Trace 1
dotnet new --uninstall dotnet-new-template-creator
nuget pack .\dotnet-new-template-creator.nuspec
dotnet new --install .\dotnet-new-template-creator.0.0.1.nupkg
cd test
rm -r *
dotnet new repo-license --license MIT
cat -TotalCount 3 LICENSE
ls
rm -r *
dotnet new repo-license --license Apache
cat -TotalCount 3 LICENSE
ls
rm -r *
dotnet new repo-license --license GPL
cat -TotalCount 3 LICENSE
ls
rm -r *
cd ..