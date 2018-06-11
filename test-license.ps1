Set-PSDebug -Trace 1
# Remove any prior templates
dotnet new --uninstall dotnet-new-template-creator
# Pack up a new NuGet package
nuget pack ./dotnet-new-template-creator.nuspec
# Install the new package
dotnet new --install ./dotnet-new-template-creator.0.0.1.nupkg
# Clear out our test output location
Remove-Item -Path test -Force -Recurse

# Spin up a new license: MIT
dotnet new repo-license --name test --license MIT --fullName "Someone SuperAwesome" --copyrightYear 2020
# Dump first three lines of resulting LICENSE file
Get-Content -TotalCount 3 test/LICENSE
# List contents of test output location (make sure nothing more than LICENSE)
Get-ChildItem -Path test
# Delete test output location contents for next test
Get-ChildItem -Path test -Include * -File -Recurse | foreach { $_.Delete() }

# Repeat for Apache and GPL
dotnet new repo-license --name test --license Apache --fullName "Someone SuperAwesome" --copyrightYear 2020
Get-Content -TotalCount 3 test/LICENSE
Get-ChildItem -Path test
Get-ChildItem -Path test -Include * -File -Recurse | foreach { $_.Delete() }
dotnet new repo-license --name test --license GPL --fullName "Someone SuperAwesome" --copyrightYear 2020
Get-Content -TotalCount 3 test/LICENSE
Get-ChildItem -Path test

# Clean up after ourselves
Remove-Item -Path test -Force -Recurse