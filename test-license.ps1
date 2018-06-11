Set-PSDebug -Trace 1
dotnet new --uninstall dotnet-new-template-creator
nuget pack ./dotnet-new-template-creator.nuspec
dotnet new --install ./dotnet-new-template-creator.0.0.1.nupkg
Get-ChildItem -Path test -Include * -File -Recurse | foreach { $_.Delete() }
dotnet new repo-license --name test --license MIT --fullName "Someone SuperAwesome" --copyrightYear 2020
Get-Content -TotalCount 3 test/LICENSE
Get-ChildItem -Path test
Get-ChildItem -Path test -Include * -File -Recurse | foreach { $_.Delete() }
dotnet new repo-license --name test --license Apache --fullName "Someone SuperAwesome" --copyrightYear 2020
Get-Content -TotalCount 3 test/LICENSE
Get-ChildItem -Path test
Get-ChildItem -Path test -Include * -File -Recurse | foreach { $_.Delete() }
dotnet new repo-license --name test --license GPL --fullName "Someone SuperAwesome" --copyrightYear 2020
Get-Content -TotalCount 3 test/LICENSE
Get-ChildItem -Path test
Get-ChildItem -Path test -Include * -File -Recurse | foreach { $_.Delete() }